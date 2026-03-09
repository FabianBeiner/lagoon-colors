param()

$ErrorActionPreference = 'Stop'

$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$repoRoot = Split-Path -Parent (Split-Path -Parent $scriptDir)
$modelPath = Join-Path $repoRoot 'sources/notepad-plus-plus/stylers.model.xml'
$palettePath = Join-Path $repoRoot 'palette/palette.oklch.json'

if (-not (Test-Path $modelPath)) {
    throw "Missing model file: $modelPath"
}

$palette = Get-Content -Raw $palettePath | ConvertFrom-Json

function Strip-Hex([string]$hex) {
    return $hex.Trim().TrimStart('#').ToUpperInvariant()
}

function Get-Rgb([string]$hex) {
    $h = Strip-Hex $hex
    return @(
        [Convert]::ToInt32($h.Substring(0,2), 16),
        [Convert]::ToInt32($h.Substring(2,2), 16),
        [Convert]::ToInt32($h.Substring(4,2), 16)
    )
}

function To-Hex([int]$r,[int]$g,[int]$b) {
    return ('{0:X2}{1:X2}{2:X2}' -f ([Math]::Clamp($r,0,255)), ([Math]::Clamp($g,0,255)), ([Math]::Clamp($b,0,255)))
}

function Mix-Hex([string]$a,[string]$b,[double]$ratioB) {
    $ra = Get-Rgb $a
    $rb = Get-Rgb $b
    $ratioA = 1.0 - $ratioB
    $r = [Math]::Round(($ra[0] * $ratioA) + ($rb[0] * $ratioB))
    $g = [Math]::Round(($ra[1] * $ratioA) + ($rb[1] * $ratioB))
    $b2 = [Math]::Round(($ra[2] * $ratioA) + ($rb[2] * $ratioB))
    return To-Hex $r $g $b2
}

function Get-Hsv([string]$hex) {
    $rgb = Get-Rgb $hex
    $r = $rgb[0] / 255.0
    $g = $rgb[1] / 255.0
    $b = $rgb[2] / 255.0

    $max = [Math]::Max($r, [Math]::Max($g, $b))
    $min = [Math]::Min($r, [Math]::Min($g, $b))
    $delta = $max - $min

    $h = 0.0
    if ($delta -ne 0) {
        if ($max -eq $r) {
            $h = 60.0 * ((($g - $b) / $delta) % 6)
        } elseif ($max -eq $g) {
            $h = 60.0 * ((($b - $r) / $delta) + 2)
        } else {
            $h = 60.0 * ((($r - $g) / $delta) + 4)
        }
    }
    if ($h -lt 0) { $h += 360.0 }

    $s = if ($max -eq 0) { 0.0 } else { $delta / $max }
    $v = $max

    return @{ h = $h; s = $s; v = $v }
}

function Get-VariantMap([pscustomobject]$variant) {
    return @{
        background = Strip-Hex $variant.background.hex
        foreground = Strip-Hex $variant.foreground.hex
        cursor = Strip-Hex $variant.cursorColor.hex
        selection = Strip-Hex $variant.selectionBackground.hex
        black = Strip-Hex $variant.black.hex
        red = Strip-Hex $variant.red.hex
        green = Strip-Hex $variant.green.hex
        yellow = Strip-Hex $variant.yellow.hex
        blue = Strip-Hex $variant.blue.hex
        purple = Strip-Hex $variant.purple.hex
        cyan = Strip-Hex $variant.cyan.hex
        white = Strip-Hex $variant.white.hex
        brightBlack = Strip-Hex $variant.brightBlack.hex
        brightRed = Strip-Hex $variant.brightRed.hex
        brightGreen = Strip-Hex $variant.brightGreen.hex
        brightYellow = Strip-Hex $variant.brightYellow.hex
        brightBlue = Strip-Hex $variant.brightBlue.hex
        brightPurple = Strip-Hex $variant.brightPurple.hex
        brightCyan = Strip-Hex $variant.brightCyan.hex
        brightWhite = Strip-Hex $variant.brightWhite.hex
    }
}

function Pick-Accent([hashtable]$c,[double]$h,[bool]$bright) {
    $prefix = if ($bright) { 'bright' } else { '' }

    $name = if ($h -lt 20 -or $h -ge 345) { 'Red' }
    elseif ($h -lt 75) { 'Yellow' }
    elseif ($h -lt 165) { 'Green' }
    elseif ($h -lt 210) { 'Cyan' }
    elseif ($h -lt 275) { 'Blue' }
    else { 'Purple' }

    if ($prefix) {
        return $c[$prefix + $name]
    }
    return $c[$name.ToLowerInvariant()]
}

function Map-Fg([string]$hex,[hashtable]$c,[string]$mode) {
    if (-not $hex) { return $hex }
    $hsv = Get-Hsv $hex

    if ($hsv.s -lt 0.12) {
        if ($mode -eq 'dark') {
            if ($hsv.v -lt 0.22) { return $c.foreground }
            if ($hsv.v -lt 0.55) { return $c.brightBlack }
            if ($hsv.v -lt 0.82) { return $c.foreground }
            return $c.brightWhite
        } else {
            if ($hsv.v -lt 0.24) { return $c.foreground }
            if ($hsv.v -lt 0.56) { return $c.brightBlack }
            if ($hsv.v -lt 0.86) { return $c.foreground }
            return $c.white
        }
    }

    $isBright = if ($mode -eq 'dark') { $hsv.v -gt 0.66 } else { $hsv.v -lt 0.48 }
    return Pick-Accent $c $hsv.h $isBright
}

function Map-Bg([string]$hex,[hashtable]$c,[string]$mode) {
    if (-not $hex) { return $hex }
    $hsv = Get-Hsv $hex

    if ($hsv.s -lt 0.10) {
        if ($mode -eq 'dark') {
            if ($hsv.v -lt 0.30) { return Mix-Hex $c.background $c.black 0.45 }
            if ($hsv.v -lt 0.60) { return Mix-Hex $c.background $c.selection 0.40 }
            return Mix-Hex $c.background $c.foreground 0.18
        }
        if ($hsv.v -lt 0.30) { return Mix-Hex $c.background $c.black 0.20 }
        if ($hsv.v -lt 0.65) { return Mix-Hex $c.background $c.brightBlack 0.18 }
        return Mix-Hex $c.background $c.blue 0.06
    }

    $accent = Pick-Accent $c $hsv.h $false
    $ratio = if ($mode -eq 'dark') { 0.26 } else { 0.16 }
    return Mix-Hex $c.background $accent $ratio
}

function Update-WidgetStyle([System.Xml.XmlElement]$node,[hashtable]$c,[string]$mode) {
    $name = $node.GetAttribute('name')

    switch ($name) {
        'Default Style' {
            $node.SetAttribute('fgColor', $c.foreground)
            $node.SetAttribute('bgColor', $c.background)
            return
        }
        'Current line background colour' {
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.62))
            return
        }
        'Selected text colour' {
            $node.SetAttribute('bgColor', $c.selection)
            $node.SetAttribute('fgColor', $(if ($mode -eq 'dark') { $c.brightWhite } else { $c.foreground }))
            return
        }
        'Multi-selected text color' {
            $node.SetAttribute('bgColor', (Mix-Hex $c.selection $c.blue 0.18))
            return
        }
        'Caret colour' {
            $node.SetAttribute('fgColor', $c.cursor)
            return
        }
        'Multi-edit carets color' {
            $node.SetAttribute('fgColor', $c.red)
            return
        }
        'Line number margin' {
            $node.SetAttribute('fgColor', (Mix-Hex $c.foreground $c.brightBlack 0.55))
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.32))
            return
        }
        'Fold margin' {
            $node.SetAttribute('fgColor', (Mix-Hex $c.foreground $c.brightBlack 0.35))
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.24))
            return
        }
        'Bookmark margin' {
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.28))
            return
        }
        'Change History margin' {
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.28))
            return
        }
        'Document map' {
            $node.SetAttribute('fgColor', $c.yellow)
            $node.SetAttribute('bgColor', (Mix-Hex $c.background $c.selection 0.20))
            return
        }
    }

    $fg = $node.GetAttribute('fgColor')
    if ($fg) { $node.SetAttribute('fgColor', (Map-Fg $fg $c $mode)) }

    $bg = $node.GetAttribute('bgColor')
    if ($bg) {
        if ((Strip-Hex $bg) -eq 'FFFFFF') {
            $node.SetAttribute('bgColor', $c.background)
        } else {
            $node.SetAttribute('bgColor', (Map-Bg $bg $c $mode))
        }
    }
}

function New-Theme([string]$mode,[string]$themeName,[string]$outPath,[datetime]$date,[string]$author) {
    [xml]$doc = Get-Content -Raw $modelPath
    $colors = Get-VariantMap $palette.variants.$mode

    $commentText = @"
Theme metadata
Name: $themeName
Author: $author
Date: $($date.ToString('yyyy-MM-dd'))
Credits: Built from stylers.model.xml (official Notepad++ model) and lagoon palette.oklch.json.
Notes: Uses background inheritance (colorStyle="1") for styles that normally use the default editor background.
"@

    $commentNode = $doc.CreateComment($commentText)
    $null = $doc.InsertBefore($commentNode, $doc.DocumentElement)

    foreach ($node in $doc.SelectNodes('//WordsStyle')) {
        $fg = $node.GetAttribute('fgColor')
        if ($fg) { $node.SetAttribute('fgColor', (Map-Fg $fg $colors $mode)) }

        $bg = $node.GetAttribute('bgColor')
        if ($bg) {
            if ((Strip-Hex $bg) -eq 'FFFFFF') {
                $node.SetAttribute('bgColor', $colors.background)
                $node.SetAttribute('colorStyle', '1')
            } else {
                $node.SetAttribute('bgColor', (Map-Bg $bg $colors $mode))
                $null = $node.RemoveAttribute('colorStyle')
            }
        }
    }

    foreach ($widget in $doc.SelectNodes('//WidgetStyle')) {
        Update-WidgetStyle $widget $colors $mode
    }

    $settings = [System.Xml.XmlWriterSettings]::new()
    $settings.Indent = $true
    $settings.IndentChars = '    '
    $settings.NewLineChars = "`r`n"
    $settings.NewLineHandling = [System.Xml.NewLineHandling]::Replace
    $settings.Encoding = [System.Text.UTF8Encoding]::new($false)

    $writer = [System.Xml.XmlWriter]::Create($outPath, $settings)
    $doc.Save($writer)
    $writer.Dispose()
}

$author = 'Fabian Beiner'
$today = Get-Date
$themesDir = Join-Path $repoRoot 'themes/notepad-plus-plus'
New-Theme -mode 'dark' -themeName 'Midnight Lagoon' -outPath (Join-Path $themesDir 'Midnight Lagoon.xml') -date $today -author $author
New-Theme -mode 'light' -themeName 'Morning Lagoon' -outPath (Join-Path $themesDir 'Morning Lagoon.xml') -date $today -author $author

Write-Output 'Created: themes/notepad-plus-plus/Midnight Lagoon.xml'
Write-Output 'Created: themes/notepad-plus-plus/Morning Lagoon.xml'




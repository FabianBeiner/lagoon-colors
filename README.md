# Lagoon Colors

A perceptually uniform color scheme for terminals, editors, and IDEs built using **OKLab color science**.

Lagoon Colors provides two carefully balanced variants:

* 🌙 **Midnight Lagoon** - dark theme
* 🌅 **Morning Lagoon** - light theme

Both share identical accent hues and contrast relationships, ensuring a consistent visual experience across dark and light environments.

The palette focuses on:

* perceptual brightness consistency
* high accessibility
* clean ANSI terminal mapping
* clearly separated hues

Inspired by ideas from Solarized, Selenized, and OKSolar.

---

# ✨ Design Principles

## Perceptual Uniformity (OKLab)

All accent colors share the same **OKLab lightness value**.

This means:

* red, green, blue, yellow, purple, and cyan appear equally bright
* syntax highlighting adds **color contrast rather than brightness contrast**
* no color unintentionally dominates the screen

Older palettes often relied on **CIELAB (1976)**, which is not truly perceptually uniform. Lagoon Colors instead uses **OKLab**, a modern color space designed to better match human perception.

---

## ♿ Accessibility

All text colors meet **WCAG 2.1 AA contrast requirements (>= 4.5:1)** against their backgrounds.

Most colors exceed **AAA contrast (>= 7:1)**.

Comments are intentionally readable rather than artificially faded.

---

## 🧭 Proper ANSI Terminal Mapping

Lagoon Colors keeps ANSI terminal slots intact.

Every color slot contains the color users expect, so standard CLI tools render correctly without theme-specific overrides.

---

# 🎨 Color Palette

## Midnight Lagoon (Dark)

| Role       | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Background | `#0B1C22` ![#0B1C22](https://placehold.co/40x20/0B1C22/0B1C22) |
| Foreground | `#B6CACB` ![#B6CACB](https://placehold.co/40x20/B6CACB/B6CACB) |
| Cursor     | `#FF7263` ![#FF7263](https://placehold.co/40x20/FF7849/FF7849) |
| Selection  | `#1B3741` ![#1B3741](https://placehold.co/40x20/1B3741/1B3741) |

### ANSI Colors

| Color  | Normal                                                         | Bright                                                         |
| ------ | -------------------------------------------------------------- | -------------------------------------------------------------- |
| Black  | `#18262C` ![#18262C](https://placehold.co/30x20/18262C/18262C) | `#6F888E` ![#6F888E](https://placehold.co/30x20/6F888E/6F888E) |
| Red    | `#F26D67` ![#F26D67](https://placehold.co/30x20/F26D67/F26D67) | `#FBA8A0` ![#FBA8A0](https://placehold.co/30x20/FBA8A0/FBA8A0) |
| Green  | `#52B65A` ![#52B65A](https://placehold.co/30x20/52B65A/52B65A) | `#84D987` ![#84D987](https://placehold.co/30x20/84D987/84D987) |
| Yellow | `#C29524` ![#C29524](https://placehold.co/30x20/C29524/C29524) | `#EAB946` ![#EAB946](https://placehold.co/30x20/EAB946/EAB946) |
| Blue   | `#2DA7ED` ![#2DA7ED](https://placehold.co/30x20/2DA7ED/2DA7ED) | `#83CAFB` ![#83CAFB](https://placehold.co/30x20/83CAFB/83CAFB) |
| Purple | `#D374CC` ![#D374CC](https://placehold.co/30x20/D374CC/D374CC) | `#F39FEC` ![#F39FEC](https://placehold.co/30x20/F39FEC/F39FEC) |
| Cyan   | `#29B2B2` ![#29B2B2](https://placehold.co/30x20/2BB3A6/2BB3A6) | `#35DADA` ![#35DADA](https://placehold.co/30x20/36DCCC/36DCCC) |
| White  | `#EEE7D8` ![#EEE7D8](https://placehold.co/30x20/EEE7D8/EEE7D8) | `#FAF5E9` ![#FAF5E9](https://placehold.co/30x20/FAF5E9/FAF5E9) |

---

## Morning Lagoon (Light)

| Role       | Value                                                          |
| ---------- | -------------------------------------------------------------- |
| Background | `#F3F0E4` ![#F3F0E4](https://placehold.co/40x20/F3F0E4/F3F0E4) |
| Foreground | `#1E343B` ![#1E343B](https://placehold.co/40x20/1E343B/1E343B) |
| Cursor     | `#D02D27` ![#D02D27](https://placehold.co/40x20/D73626/D73626) |
| Selection  | `#D3E6E6` ![#D3E6E6](https://placehold.co/40x20/D3E6E6/D3E6E6) |

### ANSI Colors

| Color  | Normal                                                         | Bright                                                         |
| ------ | -------------------------------------------------------------- | -------------------------------------------------------------- |
| Black  | `#16272D` ![#16272D](https://placehold.co/30x20/16272D/16272D) | `#546A70` ![#546A70](https://placehold.co/30x20/586F75/586F75) |
| Red    | `#B02429` ![#B02429](https://placehold.co/30x20/B63132/B63132) | `#9C141D` ![#9C141D](https://placehold.co/30x20/A51720/A51720) |
| Green  | `#167625` ![#167625](https://placehold.co/30x20/187E28/187E28) | `#12651F` ![#12651F](https://placehold.co/30x20/136C21/136C21) |
| Yellow | `#7A5D12` ![#7A5D12](https://placehold.co/30x20/836415/836415) | `#694F0E` ![#694F0E](https://placehold.co/30x20/705510/705510) |
| Blue   | `#156897` ![#156897](https://placehold.co/30x20/1870A2/1870A2) | `#105A83` ![#105A83](https://placehold.co/30x20/135F8B/135F8B) |
| Purple | `#92358D` ![#92358D](https://placehold.co/30x20/993F94/993F94) | `#851F80` ![#851F80](https://placehold.co/30x20/8A2985/8A2985) |
| Cyan   | `#167070` ![#167070](https://placehold.co/30x20/19796F/19796F) | `#126060` ![#126060](https://placehold.co/30x20/13675F/13675F) |
| White  | `#F8F5EC` ![#F8F5EC](https://placehold.co/30x20/F8F5EC/F8F5EC) | `#FEFCF6` ![#FEFCF6](https://placehold.co/30x20/FEFCF6/FEFCF6) |

---

# 📦 Available Theme Files

| Tool / Editor               | Midnight Lagoon                                       | Morning Lagoon                                      |
| --------------------------- | ----------------------------------------------------- | --------------------------------------------------- |
| Notepad++                   | `themes/notepad-plus-plus/Midnight Lagoon.xml`       | `themes/notepad-plus-plus/Morning Lagoon.xml`      |
| VS Code                     | `themes/vscode/midnight-lagoon-color-theme.json`     | `themes/vscode/morning-lagoon-color-theme.json`    |
| Windows Terminal            | `themes/windows-terminal/lagoon-colors.json`         | `themes/windows-terminal/lagoon-colors.json`       |
| Generic (CSS / JSON / SCSS) | `themes/generic/midnight-lagoon.*`                   | `themes/generic/morning-lagoon.*`                  |
| VS Code Extension (VSIX)    | `themes/vscode/dist/lagoon-colors-1.0.0.vsix`        | `themes/vscode/dist/lagoon-colors-1.0.0.vsix`      |

---

# 🗂 Repository Layout

- `palette/` source palette definitions
- `sources/` upstream source files (used by generators)
- `scripts/` generators and tools
- `themes/` generated artifacts for end users
- `docs/` GitHub Pages site (`docs/index.html`)

---

# 🧪 Color Science

Lagoon Colors is constructed in **OKLCh**, the cylindrical representation of **OKLab**.

| Parameter               | Dark   | Light  |
| ----------------------- | ------ | ------ |
| Accent Lightness        | 0.695  | 0.495  |
| Bright Accent Lightness | 0.810  | 0.445  |
| Lightness variance      | <0.002 | <0.003 |

Accent hues:

| Color  | OKLCh Hue |
| ------ | --------- |
| Red    | 25°       |
| Yellow | 85°       |
| Green  | 145°      |
| Cyan   | 195°      |
| Blue   | 240°      |
| Purple | 330°      |

Minimum hue separation: **45°** (green <-> cyan and cyan <-> blue).

Chroma is intentionally **not** equalized across hues. The sRGB gamut varies by hue, so forcing equal chroma would desaturate vivid colors like red and purple. Instead, each accent maximizes saturation within gamut at its target lightness.

### Full OKLCh Values (Dark)

| Color | Hex | L | C | h | CR | WCAG |
|-------|-----|---|---|---|-----|------|
| Foreground | `#B6CACB` | 0.824 | 0.022 | 200° | 10.22 | AAA |
| Red | `#F26D67` | 0.695 | 0.165 | 25° | 5.95 | AA |
| Green | `#52B65A` | 0.695 | 0.160 | 145° | 6.81 | AA |
| Yellow | `#C29524` | 0.694 | 0.132 | 85° | 6.33 | AA |
| Blue | `#2DA7ED` | 0.695 | 0.145 | 240° | 6.53 | AA |
| Purple | `#D374CC` | 0.695 | 0.161 | 330° | 5.93 | AA |
| Cyan | `#29B2B2` | 0.695 | 0.110 | 195° | 6.74 | AA |
| Bright Black | `#6F888E` | 0.609 | 0.030 | 214° | 4.64 | AA |
| Bright Red | `#FBA7A0` | 0.809 | 0.101 | 25° | 9.25 | AAA |
| Bright Green | `#84D987` | 0.811 | 0.141 | 145° | 10.18 | AAA |
| Bright Yellow | `#EAB946` | 0.810 | 0.140 | 85° | 9.58 | AAA |
| Bright Blue | `#83CAFB` | 0.810 | 0.100 | 240° | 9.81 | AAA |
| Bright Purple | `#F39FEC` | 0.810 | 0.139 | 330° | 9.13 | AAA |
| Bright Cyan | `#35DADA` | 0.809 | 0.128 | 195° | 10.13 | AAA |

### WCAG Compliance Summary

**Midnight Lagoon (Dark)** - 6 x AA, 8 x AAA, 1 x below (black, UI-only)

**Morning Lagoon (Light)** - 10 x AA, 2 x AAA, 2 x below (white/brightWhite, UI-only)

---

# 🌐 GitHub Pages

The project page is built from `/docs`:

- source: `docs/index.html`
- expected URL: `https://fabianbeiner.github.io/lagoon-colors/`

Use repository settings: **Pages -> Deploy from a branch -> main /docs**.

---

# 🙏 Credits

This palette builds on ideas from three seminal color scheme projects:

* **[Solarized](https://ethanschoonover.com/solarized/)** by Ethan Schoonover - the original precision-designed terminal palette
* **[Selenized](https://github.com/jan-warchol/selenized)** by Jan Warchol - better hue separation, higher contrast, proper terminal mapping
* **[OKSolar](https://meat.io/oksolar)** by Zack Voase - OKLab perceptual uniformity for accent colors

---

# 📄 License

MIT

# VS Code Theme Extension (Local)

## Install from VSIX
1. In VS Code, run: `Extensions: Install from VSIX...`
2. Choose: `themes/vscode/dist/lagoon-colors-1.0.0.vsix`

## Build VSIX
```powershell
cd vscode-extension
npx @vscode/vsce package
```
Move the generated `.vsix` into `themes/vscode/dist/`.

Repository: https://github.com/FabianBeiner/lagoon-colors

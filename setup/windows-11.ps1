# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# Install fonts
Start-BitsTransfer "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" C:\Temp\FiraCode.zip
Expand-Archive -LiteralPath 'C:\Temp\FiraCode.zip' -DestinationPath C:\Temp\Fonts

# Delete exising profiles
Remove-Item –path "~\Documents\WindowsPowerShell" –recurse –force
Remove-Item –path "~\Documents\PowerShell" –recurse –force

# Symlink profile to locations
cmd /c mklink /J %homepath%\Documents\WindowsPowerShell\ %homepath%\.dotfiles\pwsh
cmd /c mklink /J %homepath%\Documents\PowerShell\ %homepath%\.dotfiles\pwsh

# Create new profile
New-Item –Path $Profile –Type File –Force

# Windows Terminal Config Setup
Remove-Item –path ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json –recurse –force; cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json
Remove-Item –path ~\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json –recurse –force; cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json

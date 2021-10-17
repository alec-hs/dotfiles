Import-Module "..\pwsh\modules\coreFunctions.psm1"
Import-Module "..\pwsh\modules\installFonts.psm1"

# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# Install fonts
$dir = C:\Temp\Fonts
Start-BitsTransfer "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" C:\Temp\FiraCode.zip
Expand-Archive -Path C:\Temp\FiraCode.zip -DestinationPath $dir 
Remove-ItemSafely C:\Temp\FiraCode.zip
Get-ChildItem -Path $dir  *.ttf | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  Fura* | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  *Mono* | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  -Exclude "*Windows Compatible.otf" | ForEach-Object { Remove-Item -Path $_.FullName }
Install-FontsFromDir $dir

# Delete exising profiles
Remove-ItemSafely ~\Documents\WindowsPowerShell
Remove-ItemSafely ~\Documents\PowerShell


# Symlink profile to locations
cmd /c mklink /J %homepath%\Documents\WindowsPowerShell\ %homepath%\.dotfiles\pwsh
cmd /c mklink /J %homepath%\Documents\PowerShell\ %homepath%\.dotfiles\pwsh

# Windows Terminal Config Setup
#Remove-ItemSafely ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
#cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json
#Remove-ItemSafely ~\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json
#cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json

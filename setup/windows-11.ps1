#------------------------------#
#        CORE FUNCTIONS        #
#------------------------------#

# Add needed modules
Import-Module ".\pwsh\modules\coreFunctions.psm1"
Import-Module ".\pwsh\modules\installFonts.psm1"

# Hide .dotfiles folder
Get-Item "~\.dotfiles" -Force | ForEach-Object {$_.Attributes = $_.Attributes -bor [System.IO.FileAttributes]::Hidden}


#------------------------------#
#       OH MY POSH SHELL       #
#------------------------------#

# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# Install fonts
$dir = "C:\Temp\Fonts"
If(!(test-path "C:\Temp")) {New-Item -ItemType Directory -Force -Path "C:\Temp"}
Start-BitsTransfer "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" C:\Temp\FiraCode.zip
Expand-Archive -Path C:\Temp\FiraCode.zip -DestinationPath $dir 
Get-ChildItem -Path $dir  *.ttf | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  Fura* | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  *Mono* | ForEach-Object { Remove-Item -Path $_.FullName }
Get-ChildItem -Path $dir  -Exclude "*Windows Compatible.otf" | ForEach-Object { Remove-Item -Path $_.FullName }
Install-FontsFromDir $dir
Remove-ItemSafely $dir
Remove-ItemSafely C:\Temp\FiraCode.zip


#------------------------------#
#   POWERSHELL PROFILE SETUP   #
#------------------------------#

# Delete exising profiles
Remove-ItemSafely ~\Documents\WindowsPowerShell
Remove-ItemSafely ~\Documents\PowerShell

# Symlink profile to locations
cmd /c mklink /J %homepath%\Documents\WindowsPowerShell\ %homepath%\.dotfiles\pwsh
cmd /c mklink /J %homepath%\Documents\PowerShell\ %homepath%\.dotfiles\pwsh


#------------------------------#
#        AWS CLI CONFIG        #
#------------------------------#
$aws = "~\.aws"
Remove-ItemSafely $aws
cmd /c mklink /J %homepath%\.aws\ %homepath%\.dotfiles\aws
Get-Item $aws -Force | ForEach-Object {$_.Attributes = $_.Attributes -bor [System.IO.FileAttributes]::Hidden}
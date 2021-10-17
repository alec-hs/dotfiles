Function Remove-ItemSafely {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty]
        [string]
        $path
    )

    if (Test-Path $path) {
        Remove-Item $path -Force -Recurse -ErrorAction SilentlyContinue
    }
}

# Install Oh My Posh
winget install JanDeDobbeleer.OhMyPosh

# Install fonts
Start-BitsTransfer "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip" C:\Temp\FiraCode.zip
Expand-Archive -LiteralPath 'C:\Temp\FiraCode.zip' -DestinationPath C:\Temp\Fonts
Remove-ItemSafely C:\Temp\FiraCode.zip

# Delete exising profiles
Remove-ItemSafely "~\Documents\WindowsPowerShell"
Remove-ItemSafely "~\Documents\PowerShell"


# Symlink profile to locations
cmd /c mklink /J %homepath%\Documents\WindowsPowerShell\ %homepath%\.dotfiles\pwsh
cmd /c mklink /J %homepath%\Documents\PowerShell\ %homepath%\.dotfiles\pwsh

# Create new profile
New-Item –Path $Profile –Type File –Force

# Windows Terminal Config Setup
Remove-ItemSafely ~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json
Remove-ItemSafely ~\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json
cmd /c mklink /h %homepath%\AppData\Local\Packages\Microsoft.WindowsTerminalPreview_8wekyb3d8bbwe\LocalState\settings.json %homepath%\.dotfiles\windows-terminal\settings.json

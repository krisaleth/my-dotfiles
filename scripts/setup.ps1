$ErrorActionPreference = "Stop"

$Dotfiles = "$HOME\dotfiles"
$ProfileSource = "$Dotfiles\powershell\Microsoft.PowerShell_profile.ps1"

Write-Host "Setting up PowerShell dotfiles..."

if (-not (Test-Path $ProfileSource)) {
    throw "Profile source not found: $ProfileSource"
}

if (Test-Path $PROFILE) {
    if ((Get-Item $PROFILE).LinkType -eq "SymbolicLink") {
        Remove-Item $PROFILE
    }
    else {
        Move-Item $PROFILE "$PROFILE.backup"
        Write-Host "Backup: $PROFILE -> $PROFILE.backup"
    }
}

New-Item -ItemType SymbolicLink `
    -Path $PROFILE `
    -Target $ProfileSource | Out-Null

Write-Host "Linked: $PROFILE"
Write-Host "PowerShell dotfiles setup complete."
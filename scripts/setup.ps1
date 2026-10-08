$ErrorActionPreference = "Stop"

$Dotfiles = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$ProfileSource = Join-Path $Dotfiles "powershell\Microsoft.PowerShell_profile.ps1"
$ProfileBackup = "$PROFILE.backup"

Write-Host "==> Setting up PowerShell dotfiles"

if (-not (Test-Path $ProfileSource)) {
    throw "Profile source not found: $ProfileSource"
}

if (Test-Path $PROFILE) {
    $ProfileItem = Get-Item $PROFILE -Force

    if ($ProfileItem.LinkType -eq "SymbolicLink") {
        $CurrentTarget = [System.IO.Path]::GetFullPath($ProfileItem.Target)
        $ExpectedTarget = [System.IO.Path]::GetFullPath($ProfileSource)

        if ($CurrentTarget -eq $ExpectedTarget) {
            Write-Host "✓ Already linked: $PROFILE"
            Write-Host
            Write-Host "==> PowerShell dotfiles setup complete."
            exit 0
        }

        Remove-Item $PROFILE -Force
        Write-Host "Removed existing symlink: $PROFILE"
    }
    else {
        if (Test-Path $ProfileBackup) {
            throw "Backup already exists: $ProfileBackup"
        }

        Move-Item $PROFILE $ProfileBackup
        Write-Host "Backup: $PROFILE -> $ProfileBackup"
    }
}

$ProfileDirectory = Split-Path $PROFILE -Parent

if (-not (Test-Path $ProfileDirectory)) {
    New-Item -ItemType Directory -Path $ProfileDirectory -Force | Out-Null
}

New-Item `
    -ItemType SymbolicLink `
    -Path $PROFILE `
    -Target $ProfileSource | Out-Null

Write-Host "Linked: $PROFILE -> $ProfileSource"
Write-Host
Write-Host "==> PowerShell dotfiles setup complete."
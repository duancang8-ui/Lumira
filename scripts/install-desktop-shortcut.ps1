# Create (or refresh) a desktop shortcut that launches Lumira from the
# source tree via scripts/launch-lumira.ps1. Run once — the shortcut then
# survives across code changes; no further reinstallation needed when
# commits land.
#
# Usage: right-click this file in File Explorer -> "Run with PowerShell",
# or run in a terminal:
#   powershell -ExecutionPolicy Bypass -File .\scripts\install-desktop-shortcut.ps1

$ErrorActionPreference = 'Stop'

$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ShortcutPath = Join-Path $env:USERPROFILE 'Desktop\Lumira (latest).lnk'
$LauncherScript = Join-Path $PSScriptRoot 'launch-lumira.ps1'

# Prefer the same icon electron-builder ships with, if it exists; fall
# back to the built electron binary, and finally to the powershell icon.
$IconCandidates = @(
  (Join-Path $ProjectRoot 'public\lumira.ico'),
  (Join-Path $ProjectRoot 'dist\lumira.ico'),
  (Join-Path $ProjectRoot 'build\icon.ico'),
  (Join-Path $ProjectRoot 'resources\icon.ico'),
  (Join-Path $ProjectRoot 'assets\icon.ico'),
  (Join-Path $ProjectRoot 'public\favicon.ico')
)
$IconLocation = $null
foreach ($candidate in $IconCandidates) {
  if (Test-Path $candidate) {
    $IconLocation = $candidate
    break
  }
}

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = 'powershell.exe'
$Shortcut.Arguments = "-ExecutionPolicy Bypass -File `"$LauncherScript`""
$Shortcut.WorkingDirectory = $ProjectRoot
$Shortcut.Description = 'Launch Lumira from the latest source (auto-build + electron)'
if ($IconLocation) {
  $Shortcut.IconLocation = $IconLocation
}
$Shortcut.Save()

Write-Host "Created shortcut: $ShortcutPath" -ForegroundColor Green
if ($IconLocation) {
  Write-Host "Using icon: $IconLocation"
} else {
  Write-Host 'No custom icon found — shortcut will use the PowerShell icon. You can change it via right-click -> Properties -> Change Icon.'
}

#Requires -Version 5.1
<#
  Downloads this repo as ZIP from GitHub and installs SKILL into Cursor.
  Default URL matches kfqylf/aishort — change -ZipUrl if you fork.
  Usage:
    powershell -ExecutionPolicy Bypass -File .\install-from-github.ps1
    powershell -ExecutionPolicy Bypass -File .\install-from-github.ps1 -ZipUrl "https://github.com/USER/REPO/archive/refs/heads/main.zip"
#>
param(
  [string]$ZipUrl = "https://github.com/kfqylf/aishort/archive/refs/heads/main.zip"
)

$ErrorActionPreference = "Stop"
$tmp = Join-Path ([System.IO.Path]::GetTempPath()) ("aishort-" + [Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tmp | Out-Null
$zipPath = Join-Path $tmp "repo.zip"

Write-Host "Downloading: $ZipUrl"
Invoke-WebRequest -Uri $ZipUrl -OutFile $zipPath -UseBasicParsing
Expand-Archive -LiteralPath $zipPath -DestinationPath $tmp -Force

$expanded = Get-ChildItem -LiteralPath $tmp -Directory | Where-Object { $_.Name -match "aishort" -or $_.Name -match "main" } | Select-Object -First 1
if (-not $expanded) {
  $expanded = Get-ChildItem -LiteralPath $tmp -Directory | Select-Object -First 1
}
if (-not $expanded) {
  Write-Error "Could not find extracted folder under $tmp"
}

$root = $expanded.FullName
$candidates = @(
  (Join-Path $root "stock-short-term-quant\SKILL.md"),
  (Join-Path $root "SKILL.md")
)
$src = $candidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if (-not $src) {
  Write-Error "SKILL.md not found in downloaded archive. Paths checked:`n$($candidates -join "`n")"
}

$destDir = Join-Path $env:USERPROFILE ".cursor\skills\stock-short-term-quant"
New-Item -ItemType Directory -Force -Path $destDir | Out-Null
Copy-Item -LiteralPath $src -Destination (Join-Path $destDir "SKILL.md") -Force

Remove-Item -LiteralPath $tmp -Recurse -Force

Write-Host ""
Write-Host "[aishort] Installed from GitHub ZIP to:" -ForegroundColor Green
Write-Host "  $destDir\SKILL.md"
Write-Host ""
Write-Host "Restart Cursor (or Reload Window)." -ForegroundColor Yellow
Write-Host ""

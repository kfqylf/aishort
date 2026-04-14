#Requires -Version 5.1
<#
  Installs this skill into Cursor personal skills folder.
  Run from repo root (folder that contains stock-short-term-quant or root SKILL.md).
  Usage: powershell -ExecutionPolicy Bypass -File .\install.ps1
#>
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot
$destDir = Join-Path $env:USERPROFILE ".cursor\skills\stock-short-term-quant"
$srcNested = Join-Path $root "stock-short-term-quant\SKILL.md"
$srcRoot = Join-Path $root "SKILL.md"

if (Test-Path $srcNested) {
  $src = $srcNested
}
elseif (Test-Path $srcRoot) {
  $src = $srcRoot
}
else {
  Write-Error "SKILL.md not found. Expected one of:`n  $srcNested`n  $srcRoot"
}

New-Item -ItemType Directory -Force -Path $destDir | Out-Null
Copy-Item -LiteralPath $src -Destination (Join-Path $destDir "SKILL.md") -Force

Write-Host ""
Write-Host "[aishort] Installed skill to:" -ForegroundColor Green
Write-Host "  $destDir\SKILL.md"
Write-Host ""
Write-Host "Restart Cursor (or Reload Window) so the agent picks up the skill." -ForegroundColor Yellow
Write-Host ""

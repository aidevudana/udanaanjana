# Copies the Virtuo template assets into this project.
#
#   .\setup.ps1 -TemplateRoot "C:\Users\you\Downloads\Virtuo-PHP-Template"
#
# The assets folder (~63 MB) is not bundled with this project — it's part of
# your purchased ThemeForest licence, so it stays in your own copy.

param(
    [Parameter(Mandatory = $true)]
    [string]$TemplateRoot
)

$src = Join-Path $TemplateRoot "main-files\virtuo\assets"

if (-not (Test-Path $src)) {
    Write-Host "Could not find: $src" -ForegroundColor Red
    Write-Host "Point this at the folder that contains main-files\virtuo\assets"
    exit 1
}

Write-Host "Copying assets from $src ..."

if (Test-Path ".\assets") { Remove-Item ".\assets" -Recurse -Force }
Copy-Item $src ".\assets" -Recurse

$size = "{0:N0} MB" -f ((Get-ChildItem .\assets -Recurse | Measure-Object Length -Sum).Sum / 1MB)
Write-Host ""
Write-Host "Done. Assets copied ($size)." -ForegroundColor Green
Write-Host ""
Write-Host "Next:"
Write-Host "  npx serve .        # or use the VS Code Live Server extension"
Write-Host "  open http://localhost:3000"

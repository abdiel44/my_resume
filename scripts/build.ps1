[CmdletBinding()]
param(
    [string]$InputFile = "resume.tex",
    [string]$OutDir = "dist",
    [switch]$Open,
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

$RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $RepoRoot

if ($Clean) {
    if (Test-Path -LiteralPath $OutDir) {
        Remove-Item -LiteralPath $OutDir -Recurse -Force
        Write-Host "Removed $OutDir"
    }
    exit 0
}

if (-not (Test-Path -LiteralPath $InputFile)) {
    Write-Error "Input file not found: $InputFile"
    exit 1
}

$LocalTectonic = Join-Path $RepoRoot "tectonic.exe"
$TectonicCommand = Get-Command tectonic -ErrorAction SilentlyContinue

if (Test-Path -LiteralPath $LocalTectonic) {
    $Tectonic = (Resolve-Path -LiteralPath $LocalTectonic).Path
} elseif ($TectonicCommand) {
    $Tectonic = $TectonicCommand.Source
} else {
    Write-Host "Tectonic is required to build this resume, but it was not found on PATH."
    Write-Host ""
    Write-Host "Official Windows install:"
    Write-Host "  [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072"
    Write-Host "  iex ((New-Object System.Net.WebClient).DownloadString('https://drop-ps1.fullyjustified.net'))"
    Write-Host ""
    Write-Host "Tip: run the official install from this repo root to create a local tectonic.exe, or place tectonic on PATH."
    Write-Host ""
    Write-Host "Package-manager option:"
    Write-Host "  winget search tectonic"
    exit 1
}

New-Item -ItemType Directory -Force -Path $OutDir | Out-Null

Write-Host "Rendering $InputFile with Tectonic..."
& $Tectonic --outdir $OutDir $InputFile

if ($LASTEXITCODE -ne 0) {
    Write-Error "Tectonic failed with exit code $LASTEXITCODE."
    exit $LASTEXITCODE
}

$PdfName = [System.IO.Path]::GetFileNameWithoutExtension($InputFile) + ".pdf"
$PdfPath = Join-Path $OutDir $PdfName

if (-not (Test-Path -LiteralPath $PdfPath)) {
    Write-Error "Build completed, but expected PDF was not found: $PdfPath"
    exit 1
}

Write-Host "Wrote $PdfPath"

if ($Open) {
    Start-Process -FilePath $PdfPath
}

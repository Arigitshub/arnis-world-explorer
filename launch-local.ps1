$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$public = Join-Path $root "public"
$index = Join-Path $public "index.html"
$port = 8080
$url = "http://localhost:$port"

if (-not (Test-Path $index)) {
    throw "Missing file: $index"
}

$python = Get-Command python -ErrorAction SilentlyContinue

if ($python) {
    $existing = Get-CimInstance Win32_Process -Filter "Name = 'python.exe'" |
        Where-Object { $_.CommandLine -like "*http.server $port*" -and $_.CommandLine -like "*$public*" } |
        Select-Object -First 1

    if (-not $existing) {
        Start-Process -FilePath $python.Source -ArgumentList "-m", "http.server", "$port" -WorkingDirectory $public | Out-Null
        Start-Sleep -Milliseconds 900
    }

    Start-Process $url
    Write-Host "Opened $url"
    return
}

Write-Warning "Python was not found. Falling back to opening the file directly, which may trigger local browser security restrictions."
Start-Process $index

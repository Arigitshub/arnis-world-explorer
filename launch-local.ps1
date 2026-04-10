$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$public = Join-Path $root "public"
$index = Join-Path $public "index.html"

if (-not (Test-Path $index)) {
    throw "Missing file: $index"
}

Start-Process $index

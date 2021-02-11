#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)
lix run checkstyle --config etc/checkstyle.json --source src

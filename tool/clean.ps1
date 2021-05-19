#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path lib) { Remove-Item lib -Force -Recurse }
Remove-Item var/* -Exclude .gitkeep -Force -Recurse

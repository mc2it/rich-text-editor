#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path build) { Remove-Item build -Force -Recurse }
Remove-Item var/* -Exclude .gitkeep -Force -Recurse

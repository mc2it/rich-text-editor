#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1

$Env:NODE_ENV = "production"
haxe build.hxml
npm run-script build

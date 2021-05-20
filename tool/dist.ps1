#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
tool/version.ps1

$previousEnv = $Env:NODE_ENV
$Env:NODE_ENV = "production"
haxe build.hxml
haxe run.hxml
npm run build
$Env:NODE_ENV = $previousEnv

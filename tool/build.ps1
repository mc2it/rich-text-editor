#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$previousEnv = $Env:NODE_ENV
$Env:NODE_ENV = "development"
haxe build.hxml
npm run-script build
$Env:NODE_ENV = $previousEnv

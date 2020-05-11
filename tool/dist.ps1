#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$Env:NODE_ENV = 'production'
tool/clean.ps1
tool/version.ps1
haxe build.hxml
node_modules/.bin/webpack --config=etc/webpack.cjs

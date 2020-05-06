#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

tool/clean.ps1
haxe build.hxml
node_modules/.bin/webpack.ps1 --config=etc/webpack.cjs

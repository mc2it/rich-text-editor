#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$Env:NODE_ENV = 'development'
haxe build.hxml
node_modules/.bin/webpack --config=etc/webpack.cjs

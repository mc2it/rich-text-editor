#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

tool/dist.ps1
haxelib submit
npm publish --registry=https://npm.pkg.github.com
npm publish --registry=https://registry.npmjs.org
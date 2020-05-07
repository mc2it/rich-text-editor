#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

tool/dist.ps1
npm publish --registry=https://npm.pkg.github.com
npm publish --registry=https://registry.npmjs.org

#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

git reset --hard
git fetch --all --prune
git pull --rebase

haxelib install all --always
haxelib update --always
npm install --ignore-scripts --production=false
npm update --dev

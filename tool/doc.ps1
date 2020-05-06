#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

haxelib run dox --input-path var --output-path doc/api --title 'SAB Rich Text Editor' --toplevel-package sab
mkdocs build --config-file=etc/mkdocs.yaml

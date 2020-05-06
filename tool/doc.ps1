#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxelib run dox `
  --define description 'A customized build of CKEditor, a rich text editor.' `
  --define logo 'https://www.sabcomputer.com/favicon.ico' `
  --define source-path 'https://github.com/sab-international/rich-text-editor/blob/master/src' `
  --define themeColor 0x4051b5 `
  --define version $version `
  --define website 'https://www.sabcomputer.com' `
  --input-path var `
  --output-path doc/api `
  --title 'SAB Rich Text Editor' `
  --toplevel-package sab

Copy-Item doc/img/favicon.ico doc/api
mkdocs build --config-file=etc/mkdocs.yaml

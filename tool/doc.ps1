#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path docs/api) { Remove-Item docs/api -Force -Recurse }

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe --define doc-gen --no-output --xml var/api.xml build.hxml
lix run dox `
	--define description "A custom build of CKEditor, a rich text editor." `
	--define source-path "https://github.com/mc2it/rich-text-editor/blob/main/src" `
	--define themeColor 0x165898 `
	--define version $version `
	--define website "https://mc2it.github.io/rich-text-editor" `
	--include "^ckeditor\." `
	--include "^mc2it_rte\." `
	--input-path var `
	--output-path docs/api `
	--title "MC2IT Rich Text Editor"

Copy-Item docs/favicon.ico docs/api

#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe --define doc-gen --xml var/api.xml build.hxml
haxelib run dox `
	--define description "A customized build of CKEditor, a rich text editor." `
	--define source-path "https://github.com/mc2it/rich-text-editor/blob/main/src" `
	--define themeColor 0x4051b5 `
	--define version $version `
	--define website "https://www.sabcomputer.com" `
	--input-path var `
	--output-path docs/api `
	--title "MC2IT Rich Text Editor"

Copy-Item docs/favicon.ico docs/api

#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
(Get-Content package.json) -replace '"version": "\d+(\.\d+){2}"', """version"": ""$version""" | Out-File package.json

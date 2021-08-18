#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
neko "$(Split-Path $PSScriptRoot)/run.n" @args

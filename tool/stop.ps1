#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

Get-Job | Remove-Job -Force
Get-EventSubscriber | Unregister-Event -Force

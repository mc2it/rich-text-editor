#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

$action = {
	$changeType = [String] $EventArgs.ChangeType
	Write-Host "'$($EventArgs.Name)' was $($changeType.ToLower()): starting a new build..."
	$timeSpan = Measure-Command { tool/build.ps1 2>&1 | Out-Host }
	Write-Host "> Finished the build after $($timeSpan.TotalSeconds) seconds."
}

$watcher = New-Object System.IO.FileSystemWatcher (Resolve-Path src).Path
$watcher.EnableRaisingEvents = $true
$watcher.IncludeSubdirectories = $true

foreach ($event in "Changed", "Created", "Deleted", "Renamed") {
	Register-ObjectEvent $watcher $event -Action $action | Out-Null
}

try {
	tool/build.ps1
	do { Wait-Event -Timeout 1 } while ($true)
}

finally {
	$watcher.EnableRaisingEvents = $false
	$watcher.Dispose()
	Get-EventSubscriber | Unregister-Event -Force
}

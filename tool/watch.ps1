#!/usr/bin/env pwsh
Set-Location (Split-Path $PSScriptRoot)
[Console]::TreatControlCAsInput = $true

$action = {
  $changeType = [String] $Event.SourceEventArgs.ChangeType
  Write-Host "'$($Event.SourceEventArgs.Name)' was $($changeType.ToLower()): build the project..." 
  tool/build.ps1
}

$watcher = New-Object System.IO.FileSystemWatcher (Resolve-Path src).Path
$watcher.EnableRaisingEvents = $true
$watcher.IncludeSubdirectories = $true

foreach ($event in @('Changed', 'Created', 'Deleted', 'Renamed')) {
  Register-ObjectEvent $watcher $event -Action $action | Out-Null
}

$console = $Host.UI.RawUI;
while ($true) {
  if ($console.KeyAvailable -and ($console.ReadKey('AllowCtrlC,IncludeKeyUp,NoEcho').Character -eq 3)) { break }
  Start-Sleep -Milliseconds 200
}

Get-EventSubscriber | Unregister-Event

# Multiplayer integration test: one dedicated server + two clients on this machine.
# Usage: powershell -File tools\run_net_test.ps1
$godot = if ($env:GODOT) { $env:GODOT } else { "C:\Users\admin\tools\godot-4.7.2\Godot_v4.7.2-stable_win64_console.exe" }
$project = Split-Path -Parent $PSScriptRoot
$port = 24991
$log = Join-Path $project "test_output"
New-Item -ItemType Directory -Force $log | Out-Null
$server = Start-Process -FilePath $godot -ArgumentList @("--headless", "--path", "`"$project`"", "res://tools/server.tscn", "--", "--server", "--port", "$port", "--moderation-test") -RedirectStandardOutput "$log\net_server.txt" -RedirectStandardError "$log\net_server_err.txt" -PassThru -WindowStyle Hidden
Start-Sleep -Seconds 4
$a = Start-Process -FilePath $godot -ArgumentList @("--headless", "--path", "`"$project`"", "res://tests/net_client.tscn", "--", "--role", "A", "--port", "$port") -RedirectStandardOutput "$log\net_a.txt" -RedirectStandardError "$log\net_a_err.txt" -PassThru -WindowStyle Hidden
Start-Sleep -Seconds 1
$b = Start-Process -FilePath $godot -ArgumentList @("--headless", "--path", "`"$project`"", "res://tests/net_client.tscn", "--", "--role", "B", "--port", "$port") -RedirectStandardOutput "$log\net_b.txt" -RedirectStandardError "$log\net_b_err.txt" -PassThru -WindowStyle Hidden
# Touching .Handle keeps the handle open so ExitCode is readable after exit.
$null = $a.Handle; $null = $b.Handle
$a.WaitForExit(60000) | Out-Null
$b.WaitForExit(60000) | Out-Null
if (-not $server.HasExited) { Stop-Process -Id $server.Id -Force }
Write-Output "---- server"
Get-Content "$log\net_server.txt" | Where-Object { $_ -match '\[server\]' }
Write-Output "---- client A (exit $($a.ExitCode))"
Get-Content "$log\net_a.txt" | Where-Object { $_ -match '\[A\]' }
Write-Output "---- client B (exit $($b.ExitCode))"
Get-Content "$log\net_b.txt" | Where-Object { $_ -match '\[B\]' }
$errs = @(Get-Content "$log\net_a_err.txt", "$log\net_b_err.txt", "$log\net_server_err.txt" -ErrorAction SilentlyContinue | Where-Object { $_ -match 'SCRIPT ERROR|Invalid' })
if ($errs.Count -gt 0) { Write-Output "---- script errors"; $errs }
if ($a.ExitCode -eq 0 -and $b.ExitCode -eq 0 -and $errs.Count -eq 0) { Write-Output "NET TEST PASSED"; exit 0 } else { Write-Output "NET TEST FAILED"; exit 1 }

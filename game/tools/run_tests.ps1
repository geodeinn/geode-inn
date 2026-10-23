# Runs the headless test suite. Usage:  powershell -File tools\run_tests.ps1
# Set GODOT to your Godot 4.7 console executable if it isn't at the default path.
# Fails if any test fails OR if Godot printed a script/engine error, because a
# GDScript runtime error inside a test would otherwise look like a pass.
$godot = if ($env:GODOT) { $env:GODOT } else { "C:\Users\admin\tools\godot-4.7.2\Godot_v4.7.2-stable_win64_console.exe" }
$project = Split-Path -Parent $PSScriptRoot
# Refresh the import and global class cache first so new class_name scripts are known.
& $godot --headless --path $project --import 2>&1 | Out-Null
$out = & $godot --headless --path $project res://tests/test_runner.tscn 2>&1 | ForEach-Object { "$_" }
$code = $LASTEXITCODE
# The machine running CI may have no sound card; those driver messages are expected.
$ignore = 'WASAPI|audio_driver|All audio drivers failed|dummy driver|at: (init|audio_device_init|initialize) \((drivers|servers)/'
$errors = $out | Where-Object { ($_ -match 'SCRIPT ERROR|ERROR:|Parse Error|Invalid call|Invalid access') -and ($_ -notmatch $ignore) }
$out | Where-Object { $_ -notmatch $ignore -and $_ -notmatch '^\s*$' }
if ($errors) {
    Write-Output "ENGINE ERRORS DURING TESTS:"
    $errors | ForEach-Object { Write-Output "  $_" }
    exit 2
}
exit $code

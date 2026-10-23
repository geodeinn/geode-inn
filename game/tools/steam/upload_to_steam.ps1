# Uploads the Windows build to Steam.
#   powershell -File tools\steam\upload_to_steam.ps1 -SteamUser <the Steamworks build account>
#
# Needs: steamcmd (https://developer.valvesoftware.com/wiki/SteamCMD) on PATH or
# at -SteamCmd, data/platform.json steam.app_id and steam.depot_windows filled
# in, and a fresh export at build/windows/GeodeInn.exe. Steam asks for the
# account's password and Steam Guard code itself; nothing is stored here.
# The build lands on the "default" branch unpublished: set it live in the
# Steamworks site (SteamPipe > Builds) when it's been checked.
param(
    [Parameter(Mandatory = $true)][string]$SteamUser,
    [string]$SteamCmd = "steamcmd",
    [string]$Description = ""
)
$ErrorActionPreference = "Stop"
$game = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$platform = Get-Content (Join-Path $game "data\platform.json") -Raw | ConvertFrom-Json
$appId = [int]$platform.steam.app_id
$depotId = [int]$platform.steam.depot_windows
if ($appId -le 0 -or $depotId -le 0) {
    throw "Set steam.app_id and steam.depot_windows in data/platform.json first (Steamworks > App Admin)."
}
$exe = Join-Path $game "build\windows\GeodeInn.exe"
if (-not (Test-Path $exe)) { throw "Export the Windows build first: build\windows\GeodeInn.exe" }

$out = Join-Path $game "build\steam"
$content = Join-Path $out "content"
if (Test-Path $content) { Remove-Item $content -Recurse -Force }
New-Item -ItemType Directory -Force $content | Out-Null
Copy-Item $exe $content
Copy-Item (Join-Path $game "CREDITS.md") $content
$version = (Get-Item $exe).VersionInfo.ProductVersion
if ([string]::IsNullOrEmpty($Description)) { $Description = "The Geode Inn $version" }

$utf8 = New-Object Text.UTF8Encoding($false)
$depotVdf = Join-Path $out "depot_build_windows.vdf"
$appVdf = Join-Path $out "app_build.vdf"
[IO.File]::WriteAllText($depotVdf, @"
"DepotBuild"
{
    "DepotID" "$depotId"
    "ContentRoot" "$($content.Replace('\','\\'))"
    "FileMapping"
    {
        "LocalPath" "*"
        "DepotPath" "."
        "Recursive" "1"
    }
}
"@, $utf8)
[IO.File]::WriteAllText($appVdf, @"
"AppBuild"
{
    "AppID" "$appId"
    "Desc" "$Description"
    "BuildOutput" "$((Join-Path $out 'output').Replace('\','\\'))"
    "Depots"
    {
        "$depotId" "$($depotVdf.Replace('\','\\'))"
    }
}
"@, $utf8)
Write-Output "Uploading $Description (app $appId, depot $depotId)..."
& $SteamCmd +login $SteamUser +run_app_build $appVdf +quit
if ($LASTEXITCODE -ne 0) { throw "steamcmd failed ($LASTEXITCODE). See build\steam\output for its logs." }
Write-Output "Uploaded. Set the build live in Steamworks > SteamPipe > Builds when it's checked."

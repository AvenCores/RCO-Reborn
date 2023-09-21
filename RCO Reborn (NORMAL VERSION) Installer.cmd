@echo off

echo.
echo RCO Reborn (NORMAL VERSIOIN) was created and is maintained by avencores
echo.

echo.
echo Starting RCO installation...
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("C:\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if not exist "%folder%\ClientSettings" (
    mkdir "%folder%\ClientSettings"
)

echo Downloading ClientAppSettings.json file...
powershell.exe -Command "& {(New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/AvenCores/RCO-Reborn/main/Normal/ClientAppSettings.json', '%folder%\ClientSettings\ClientAppSettings.json')}"
if %errorlevel% EQU 0 (
    echo ClientAppSettings.json downloaded successfully!
    echo.
    echo SUCCESS: RCO Reborn (NORMAL VERSIOIN) installation completed!
) else (
    echo Failed to download ClientAppSettings.json.
    echo.
    echo ERROR: RCO Reborn (NORMAL VERSIOIN) installation failed!
)

echo Press any key to continue... & pause >nul

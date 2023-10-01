@echo off

echo.
echo RCO Reborn Uninstaller was created and is maintained by avencores
echo.

for /d %%i in ("%localappdata%\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("%cd:~0,2%\Program Files (x86)\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

for /d %%i in ("%cd:~0,2%\Program Files\Roblox\Versions\*") do (
    if exist "%%i\RobloxPlayerBeta.exe" (
        set folder=%%i
        goto :NextStep
    )
)

:NextStep
if exist "%folder%\ClientSettings\ClientAppSettings.json" (
    del "%folder%\ClientSettings\ClientAppSettings.json"
)

echo RCO Reborn has been successfully deleted!
echo.

echo Press any key to continue... & pause >nul
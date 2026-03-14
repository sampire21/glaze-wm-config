@echo off
taskkill /IM glazewm.exe /F >nul 2>&1
timeout /t 1 /nobreak >nul
start "" "%LOCALAPPDATA%\Microsoft\WinGet\Packages\glzr-io.glazewm_Microsoft.Winget.Source_8wekyb3d8bbwe\glazewm.exe" start

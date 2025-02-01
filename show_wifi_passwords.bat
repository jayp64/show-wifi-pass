@echo off
title WiFi Password Viewer
color 0a
echo =============================================
echo    WiFi Network Names (SSIDs) and Passwords
echo =============================================
echo.

:: Get all WiFi profiles
for /f "skip=9 tokens=2 delims=:" %%i in ('netsh wlan show profiles') do (
    set "ssid=%%i"
    setlocal enabledelayedexpansion
    set "ssid=!ssid:~1!"
    echo SSID: !ssid!
    
    :: Get the password for each profile
    for /f "tokens=2 delims=:" %%p in ('netsh wlan show profile name^="!ssid!" key^=clear ^| find "Key Content"') do (
        set "password=%%p"
        setlocal enabledelayedexpansion
        set "password=!password:~1!"
        echo Password: !password!
        endlocal
    )
    echo.
    endlocal
)

echo =============================================
echo    End of List
echo =============================================
pause
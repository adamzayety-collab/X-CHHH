@echo off
title Full Discord Permission Reset
color 5F

echo === Resetting Discord Permissions ===

:: المسار الكامل لمجلد Discord
set "ds=%AppData%\discord"

echo.
echo Removing all DENY rules...
icacls "%ds%" /remove:d Everyone /T

echo.
echo Resetting permissions to default...
icacls "%ds%" /reset /T

echo.
echo Granting full access to the user...
icacls "%ds%" /grant:r "%USERNAME%":(OI)(CI)(F) /T

echo.
echo Cleaning read-only attributes...
attrib -R "%ds%" /S /D

echo.
echo ✅ Discord permissions fully restored.
echo Restart Discord now.
pause

@echo off
title Installer Script
echo You may be required to interact with the console or installation windows
pause
echo Going to root directory...
set startpath=%cd%
cd C:\
FOR /F "tokens=*" %%i IN (%startpath%\programs.txt) DO (
    echo Installing %%i...
    winget install "%%i"
)
FOR /F "tokens=*" %%i In (%startpath%\pip.txt) DO (
    echo Installing %%i...
    pip install %%i
)
echo Returning to previous directory...
cd %startpath%
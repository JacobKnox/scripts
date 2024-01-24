@echo off
SET versions=7.4.7 8.1.23
SET version=%~1
SHIFT
SET vercheck=0
SET params=%1
:loop
shift
if [%1]==[] GOTO:afterloop
set params=%params% %1
GOTO:loop
:afterloop
IF %version% == "" (
    echo Expected a version of PHP, but one was not found.
    GOTO:end
) ELSE (
    for %%v in (%versions%) do (
        IF %version% == %%v SET vercheck=1
    )
)
IF %vercheck% == 0 (
    echo That version of PHP isn't installed yet!
    GOTO:end
)
"C:\Program Files\PHP\PHP %version%\php.exe" %params%
:end
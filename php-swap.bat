@echo off
setlocal EnableDelayedExpansion
SET versions=7.4.7 8.1.23
SET version=%~1
SHIFT
SET vercheck=0
IF %version% == "" (
    echo Expected a version of PHP, but one was not found.
    GOTO:end
) ELSE (
    for %%v in (%versions%) do (
        IF %version% == %%v SET vercheck=1
    )
)
IF !vercheck! == 0 (
    echo That version of PHP isn't installed yet!
    GOTO:end
)
SET newpath=
SET found=0
FOR %%a IN ("%path:;=";"%") DO (
    SET temp=%%~a
    SET substring=!temp:~0,20!
    IF NOT "!substring!" == "C:\Program Files\PHP" (
        SET "newpath=!newpath!!temp!;"
    ) ELSE (
        IF NOT "!temp!" == "C:\Program Files\PHP\PHP %version%" (
            IF !found! == 0 (
                SET "newpath=!newpath!C:\Program Files\PHP\PHP %version%;!temp!;"
                SET found=1
            ) ELSE (
                SET "newpath=!newpath!!temp!;"
            )
        )
    )
)
(
    ENDLOCAL
    SET backup=%path%
    SET "temppath=%newpath:~0,-1%"
    ::SET "path=%temppath%"
    ECHO Checking PHP version. If it did not swap, try again.
    SET result=php -v
    IF %result:~0,4% == "'php'" (
        SET "path=%backup%"
        ECHO You did an oopsie. Try again?
    )
    ECHO %result:~0,-55%
    EXIT /B 0
)
:end
@echo off
SET versions=3.9 3.12
SET version=""
SET name=""
SET create=0
SET vercheck=0
SET previous=""
:loop
IF "%~1" == "-c" SET create=1
IF "%~1" == "--create" SET create=1
IF %previous% == "-v" SET version=%1
IF %previous% == "--version" SET version=%1
IF %previous% == "-n" SET name=%1
IF %previous% == "--name" SET name=%1
SET previous="%~1"
SHIFT
IF NOT "%~1"=="" GOTO:loop
IF %version% == "" (
    echo Expected a version of Python, but one was not found. Please provide a version by using -v or --version.
    GOTO:end
) ELSE (
    for %%v in (%versions%) do (
        IF %version% == %%v SET vercheck=1
    )
)
IF %vercheck% == 0 (
    echo That version of Python isn't installed yet!
    GOTO:end
)
IF %name% == "" (
    echo Expected a virtual environment name, but one was not found. Please provide a name by using -n or --name.
    GOTO:end
)
IF %create% == 0 GOTO:activate
py -%version% -m virtualenv "c:/Program Files/Python/venvs/Python %version%/%name%"
:activate
IF NOT EXIST c:/"Program Files"/Python/venvs/"Python %version%"/%name%/ (
    echo Virtual environment %name% doesn't exist for Python %version%. Check that you spelled it right and selected the correct version. Otherwise, you can create it with the -c or --create flag.
    GOTO:end
) ELSE c:/"Program Files"/Python/venvs/"Python %version%"/%name%/Scripts/activate
:end
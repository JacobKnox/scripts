# Scripts
Random scripts I've written for random reasons.

## [Installer](https://github.com/JacobKnox/scripts/tree/main/Installer)
A simple installation Batch script that installs programs from Winget (programs.txt) and Python packages (pip.txt). I wrote this because there have been multiple occasions where I've had to start from scratch due to my computers crashing or getting a new computer and it got frustrating. This is the start of my attempts to begin automating the setup of my workflow(s).

## [py-venv](https://github.com/JacobKnox/scripts/blob/main/py-venv.bat)
py-venv.bat will create and/or activate a Python virtual environment using a specified version of python. Example: py-venv -v 3.9 -n Test -c
Arguments: -v / --version [version], -n / --name [name], -c / --create
- Version (of Python) and name (of virtual environment) are required
- Create is an optional flag. Pass it if the environment needs to be created.

## [php-ver](https://github.com/JacobKnox/scripts/blob/main/php-ver.bat)
php-ver.bat will run the specified commands in the specific version of PHP. Example: php-ver 7.4.7 -v
Arguments: [version] [commands]
- Version (of PHP) and commands are required

## [php-swap](https://github.com/JacobKnox/scripts/blob/main/php-swap.bat)
php-swap.bat is meant to move the specified version of PHP above all other PHP versions in your path environment variable from the command line, but has been giving me issues and does not currently work.
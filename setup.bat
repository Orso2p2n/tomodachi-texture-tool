@echo off
:: Title
echo Setting up Python 3.14.4 and Project Environment

:: Set the working directory to the location of the .bat file
cd /d "%~dp0"

:: Download and Install Python 3.14.4
echo Downloading Python 3.14.4...
curl -O https://www.python.org/ftp/python/3.14.4/python-3.14.4-amd64.exe

echo Installing Python 3.14.4...
python-3.14.4-amd64.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0

:: Check if Python was installed
python --version
if %errorlevel% neq 0 (
    echo Python installation failed. Please check manually.
    pause
    exit /b
)

:: Install Virtualenv (optional but recommended)
echo Installing virtualenv...
python -m pip install --upgrade pip --user
pip install virtualenv --user

:: Create Virtual Environment
set "VENV_DIR=.venv"

echo Creating virtual environment...
python -m venv %VENV_DIR%

:: Activate the virtual environment
call %VENV_DIR%\Scripts\Activate.bat

:: Install Requirements
if exist "requirements.txt" (
    echo Installing requirements from requirements.txt...
    python -m pip install --upgrade pip
    python -m pip --version
    pip install -r requirements.txt
) else (
    echo requirements.txt not found. Skipping dependencies installation.
)

:: Clean up installer
if exist "python-3.14.4-amd64.exe" (
    del /f /q python-3.14.4-amd64.exe
)

echo Setup complete!
pause

@echo off

:: Set the working directory to the location of the .bat file
cd /d "%~dp0"

:: Check if the virtual environment exists
set "VENV_DIR=.venv"
if not exist "%VENV_DIR%\Scripts\activate.bat" (
    echo Virtual environment not found.
    echo Please run setup.bat
    pause
    exit /b
)

:: Activate the virtual environment
call %VENV_DIR%\Scripts\activate.bat

echo Building...
python -m PyInstaller TomodachiTextureTool.spec

echo Done! Executable is at: dist\TomodachiTextureTool.exe

pause

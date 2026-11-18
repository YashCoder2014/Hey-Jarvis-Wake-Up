@echo off
:: Auto Admin - YASH ka MARK LV
%1 mshta vbscript:CreateObject("Shell.Application").ShellExecute("cmd.exe","/c %~s0 ::","","runas",1)(window.close)&&exit

title MARK LV - J.A.R.V.I.S Activating...
color 0B
cd /d "%~dp0"

echo.
echo  [MARK LV] Initializing J.A.R.V.I.S Core...
echo  [MARK LV] Checking Python...

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo  [ERROR] Python not found! Install Python and add to PATH
    pause
    exit /b
)

:: Check if file exists on Desktop OR same folder
if exist "C:\Users\YASH\Desktop\JARVIS Activate Command.py" (
    cd /d "C:\Users\YASH\Desktop"
    python "JARVIS Activate Command.py"
) else if exist "%~dp0JARVIS Activate Command.py" (
    python "%~dp0JARVIS Activate Command.py"
) else (
    echo  [ERROR] JARVIS Activate Command.py not found!
    echo  Looking in: C:\Users\YASH\Desktop\ and %~dp0
)

if %errorlevel% neq 0 (
    echo.
    echo  [CRASH] Jarvis failed. Installing missing libs...
    pip install PyQt6 psutil openai requests
    echo  Retrying...
    python "JARVIS Activate Command.py"
)

pause
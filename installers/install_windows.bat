@echo off
setlocal enabledelayedexpansion

echo ====================================================
echo             Levitate Coding AI Installer
echo ====================================================
echo.

:: Define install directory
set "INSTALL_DIR=%USERPROFILE%\.local\bin"
if not exist "%INSTALL_DIR%" (
    echo Creating installation folder: %INSTALL_DIR%
    mkdir "%INSTALL_DIR%"
)

:: Create lev.py in install directory
echo Writing lev.py...
(
echo import os
echo import sys
echo import json
echo import pathlib
echo import urllib.request
echo import urllib.error
echo.
echo SYSTEM_INSTRUCTION = """
echo You are Levitate, an elite, high-performance programming assistant. 
echo Your goal is to provide exceptionally clean, efficient, and production-ready code.
echo - Focus strictly on the code, architecture, and technical implementation.
echo - Avoid unnecessary conversational filler, warnings, or basic explanations unless explicitly asked.
echo - Provide code blocks with correct syntax highlighting.
echo - Prioritize modern best practices, optimal time/space complexity, and robust error handling.
echo """
echo.
echo def main^(^):
echo     args = sys.argv[1:]
echo     if not args:
echo         print^("\033[1;35m" + r"""
echo  _      _____     _  _____ _____  ___ _____ _____ 
echo ^| ^|    ^|  ___^|   ^| ^|^|_   _^|_   _^|/ _ \_   _^|  ___^|
echo ^| ^|    ^| ^|__ \ \ / /  ^| ^|   ^| ^| / /_\ \^| ^| ^| ^|__  
echo ^| ^|    ^|  __^| \ V /   ^| ^|   ^| ^| ^|  _  ^|^| ^| ^|  __^| 
echo ^| ^|____^| ^|___  \ _/  _^| ^|_  ^| ^| ^| ^| ^| ^|^| ^| ^| ^|___ 
echo \_____/\____/   \_/  \___/  \_/ \_^| ^|_/\_/ \____/ 
echo """ + "\033[0m"^)
echo         print^("\033[1;36m=== Levitate Coding AI ===\033[0m"^)
echo         print^("Usage: lev <your coding prompt>"^)
echo         print^("Example: lev write a python script to parse logs\n"^)
echo         sys.exit^(0^)
echo     prompt = " ".join^(args^)
echo     print^("\nThinking...", end="", flush=True^)
echo     url = "https://text.pollinations.ai/"
echo     payload = {
echo         "messages": [
echo             {"role": "system", "content": SYSTEM_INSTRUCTION},
echo             {"role": "user", "content": prompt}
echo         ],
echo         "model": "qwen"
echo     }
echo     data = json.dumps^(payload^).encode^("utf-8"^)
echo     req = urllib.request.Request^(
echo         url,
echo         data=data,
echo         headers={"Content-Type": "application/json"}
echo     ^)
echo     try:
echo         with urllib.request.urlopen^(req^) as response:
echo             res_text = response.read^(^).decode^("utf-8"^)
echo             print^("\r           \r"^)
echo             print^(res_text^)
echo     except urllib.error.HTTPError as e:
echo         print^(f"\nHTTP Error {e.code}: {e.reason}"^)
echo         try:
echo             error_details = e.read^(^).decode^("utf-8"^)
echo             print^("Details:", error_details^)
echo         except:
echo             pass
echo     except Exception as e:
echo         print^(f"\nError connecting to API: {e}"^)
echo.
echo if __name__ == "__main__":
echo     main^(^)
) > "%INSTALL_DIR%\lev.py"

:: Create lev.bat in install directory
echo Writing launcher...
(
echo @echo off
echo python "%%~dp0lev.py" %%*
) > "%INSTALL_DIR%\lev.bat"

:: Verify Python installation
where python >nul 2>nul
if errorlevel 1 (
    echo [WARNING] Python was not detected in your PATH.
    echo Please install Python 3 to run Levitate.
)

:: Add path using PowerShell
powershell -Command "[Environment]::GetEnvironmentVariable('Path', 'User')" > temp_path.txt
findstr /i /c:"%INSTALL_DIR%" temp_path.txt >nul
if errorlevel 1 (
    echo Adding %INSTALL_DIR% to your User PATH...
    powershell -Command "[Environment]::SetEnvironmentVariable('Path', [Environment]::GetEnvironmentVariable('Path', 'User') + ';%INSTALL_DIR%', 'User')"
    echo [SUCCESS] Added to User PATH.
) else (
    echo %INSTALL_DIR% is already in your PATH.
)
del temp_path.txt

echo.
echo ====================================================
echo   Levitate Installer finished successfully!
echo   Open a new terminal and type:
echo.
echo       lev
echo ====================================================
echo.
pause

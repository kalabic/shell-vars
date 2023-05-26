@Echo OFF
REM Change directory to where script is and add itself to PATH. Re-open CMD or PowerShell and test.
cd "%~dp0"
powershell.exe .\shellpath add .
pause

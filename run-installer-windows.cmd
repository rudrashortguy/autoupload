@echo off
REM AutoUpload installer launcher - double-click this file.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0installer-for-windows.ps1"
echo.
pause

@echo off
REM -----------------------------------------------------------------------------
REM Gradle start up script for Windows with automatic gradle-wrapper.jar bootstrap
REM -----------------------------------------------------------------------------

setlocal
set DIRNAME=%~dp0
set JARPATH=%DIRNAME%gradle\wrapper\gradle-wrapper.jar

if exist "%JARPATH%" (
    echo gradle-wrapper.jar found at %JARPATH%
    java -jar "%JARPATH%" %*
    exit /b %ERRORLEVEL%
) else (
        echo gradle-wrapper.jar not found. Attempting to download via PowerShell script...
        powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0gradle-wrapper-bootstrap.ps1"

    if exist "%JARPATH%" (
        echo Download succeeded.
        java -jar "%JARPATH%" %*
        exit /b %ERRORLEVEL%
    ) else (
        echo Failed to download gradle-wrapper.jar. Please download manually to %DIRNAME%gradle\wrapper\ and try again.
        exit /b 1
    )
)

@echo off
REM -----------------------------------------------------------------------------
REM Gradle start up script for Windows
REM -----------------------------------------------------------------------------

set DIRNAME=%~dp0
set PRG=%~dp0\gradle\wrapper\gradle-wrapper.jar

if exist "%PRG%" (
  java -jar "%PRG%" %*
) else (
  echo gradle-wrapper.jar not found in %PRG%
  echo Please download the gradle wrapper jar into the folder: %DIRNAME%gradle\wrapper\
  exit /b 1
)

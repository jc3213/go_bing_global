@ECHO OFF
SET Zip=%ProgramFiles%\7-Zip\7z.exe
IF NOT EXIST "%Zip%" GOTO :Exit
:Mode
ECHO Auto build script for extension ^<New Bing in China^>
ECHO 1. Manifest V2
ECHO 2. Manifest V3
SET /P Option=Build for: 
IF %Option% EQU 1 CALL :Make mv2
IF %Option% EQU 2 CALL :Make mv3
CLS && GOTO :Mode
:Make
SET Mode=%~dp0%1
FOR /F "USEBACKQ SKIP=3 TOKENS=1,2 DELIMS=,: " %%I IN (%Mode%\manifest.json) DO (IF %%~I EQU version SET Out=%Mode%-%%~J.zip)
"%Zip%" a "%Out%" "%CD%\main\*"
"%Zip%" u "%Out%" -ux2 "%Mode%\*"
ECHO.
ECHO.
ECHO "%Out%" build completed, script will be terminated in 5 seconds...
:Exit
TIMEOUT /T 5
EXIT

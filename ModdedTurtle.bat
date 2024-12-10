@echo off
setlocal

:: Create 'Temp' Directory
if not exist "%~dp0\bin\Temp" mkdir "%~dp0\bin\Temp"

:: Set Current Version Number
set /p current=<version.txt

:: Get Latest Version File
echo Comparing versions...
type NUL > "%~dp0\bin\Temp\version_new.txt"
powershell -c "(Invoke-WebRequest -URI 'https://raw.githubusercontent.com/Lewwy95/ModdedTurtle/main/version.txt').Content | Set-Content -Path '%~dp0\bin\Temp\version_new.txt'"
cls

:: Set Latest Version Number
set /p new=<"%~dp0\bin\Temp\version_new.txt"

:: Print Version Information
echo Checking for updates...
echo.
echo Current: v%current%
echo Latest: v%new%
timeout /t 2 /nobreak >nul
cls

:: Clear New Version File
del /s /q "%~dp0\bin\Temp\version_new.txt"
cls

:: Check For Different Version Files
if %new% neq %current% (
    echo Update required! Downloading...
    timeout /t 2 /nobreak >nul
    cls
    goto download
)

:: Check For Install
if exist "%~dp0..\Interface\AddOns\pfQuest-turtle" goto launch

:: Not Installed
echo ModdedTurtle is not installed! Installing...
timeout /t 2 /nobreak >nul
cls
goto install

:: Installation/Updater
:download
echo Downloading latest revision...
powershell -c "(New-Object System.Net.WebClient).DownloadFile('https://github.com/Lewwy95/ModdedTurtle/archive/refs/heads/main.zip','%~dp0\bin\Temp\ModdedTurtle-main.zip')"
cls

:: Extract Latest Revision
echo Extracting latest revision...
powershell -c "Expand-Archive '%~dp0\bin\Temp\ModdedTurtle-main.zip' -Force '%~dp0\bin\Temp'"
cls

:: Clear Addons Folder
echo Clearing addons folder...
del /s /q "%~dp0\bin\AddOns\*"
rmdir /s /q "%~dp0\bin\AddOns"
mkdir "%~dp0\bin\AddOns"
cls

:: Deploy Latest Revision
echo Deploying latest revision...
xcopy /s /y "%~dp0\bin\Temp\ModdedTurtle-main" "%~dp0"
cls

:: Apply New Version File
break>version.txt
powershell -c "(Invoke-WebRequest -URI 'https://raw.githubusercontent.com/Lewwy95/ModdedTurtle/main/version.txt').Content | Set-Content -Path '%~dp0\version.txt'"
cls

:: Uninstall All Addons
:install
call "%~dp0\Uninstall.bat"

:: Move New Addons
echo Installing addons...
xcopy /s /y "%~dp0\bin\AddOns\*" "%~dp0..\Interface\AddOns\"
cls

:: Move New Patches
echo Installing patches...
xcopy /s /y "%~dp0\bin\Patches\*" "%~dp0..\Data\"
cls

:: Clear 'Temp' Folder
echo Cleaning up...
del /s /q "%~dp0\bin\Temp\*"
rmdir /s /q "%~dp0\bin\Temp"
mkdir "%~dp0\bin\Temp"
cls

:: Launch Game
:launch
echo Launching game...
timeout /t 2 /nobreak >nul
start "" "%~dp0..\TurtleWoW.exe"

:: Finish
endlocal

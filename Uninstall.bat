@echo off
setlocal

:: Uninstall addons
if exist "%~dp0..\Interface\AddOns\codex" rmdir /s /q "%~dp0..\Interface\AddOns\codex"
if exist "%~dp0..\Interface\AddOns\HCQuest" rmdir /s /q "%~dp0..\Interface\AddOns\HCQuest"
if exist "%~dp0..\Interface\AddOns\pfQuest" rmdir /s /q "%~dp0..\Interface\AddOns\pfQuest"
if exist "%~dp0..\Interface\AddOns\pfQuest-turtle" rmdir /s /q "%~dp0..\Interface\AddOns\pfQuest-turtle"
if exist "%~dp0..\Interface\AddOns\ShaguTweaks" rmdir /s /q "%~dp0..\Interface\AddOns\ShaguTweaks"

:: Uninstall patches
if exist "%~dp0..\WoW_tweaked.exe" del /s /q "%~dp0..\WoW_tweaked.exe"
if exist "%~dp0..\vanilla-tweaks.exe" del /s /q "%~dp0..\vanilla-tweaks.exe"
if exist "%~dp0..\Data\Patch-Y.mpq" del /s /q "%~dp0..\Data\Patch-Y.mpq"

endlocal

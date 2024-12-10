@echo off
setlocal

:: Uninstall addons
if exist "%~dp0..\Interface\AddOns\Bagnon" rmdir /s /q "%~dp0..\Interface\AddOns\Bagnon"
if exist "%~dp0..\Interface\AddOns\Bagnon_Core" rmdir /s /q "%~dp0..\Interface\AddOns\Bagnon_Core"
if exist "%~dp0..\Interface\AddOns\Bagnon_Forever" rmdir /s /q "%~dp0..\Interface\AddOns\Bagnon_Forever"
if exist "%~dp0..\Interface\AddOns\Bagnon_Options" rmdir /s /q "%~dp0..\Interface\AddOns\Bagnon_Options"
if exist "%~dp0..\Interface\AddOns\Cleanup" rmdir /s /q "%~dp0..\Interface\AddOns\Cleanup"
if exist "%~dp0..\Interface\AddOns\codex" rmdir /s /q "%~dp0..\Interface\AddOns\codex"
if exist "%~dp0..\Interface\AddOns\HCQuest" rmdir /s /q "%~dp0..\Interface\AddOns\HCQuest"
if exist "%~dp0..\Interface\AddOns\pfQuest" rmdir /s /q "%~dp0..\Interface\AddOns\pfQuest"
if exist "%~dp0..\Interface\AddOns\pfQuest-turtle" rmdir /s /q "%~dp0..\Interface\AddOns\pfQuest-turtle"
if exist "%~dp0..\Interface\AddOns\Rested" rmdir /s /q "%~dp0..\Interface\AddOns\Rested"
if exist "%~dp0..\Interface\AddOns\ShaguPlates" rmdir /s /q "%~dp0..\Interface\AddOns\ShaguPlates"
if exist "%~dp0..\Interface\AddOns\ShaguTweaks" rmdir /s /q "%~dp0..\Interface\AddOns\ShaguTweaks"
if exist "%~dp0..\Interface\AddOns\SortBags" rmdir /s /q "%~dp0..\Interface\AddOns\SortBags"

:: Uninstall patches
if exist "%~dp0..\Data\patch-Y.mpq" del /s /q "%~dp0..\Data\patch-Y.mpq"

endlocal

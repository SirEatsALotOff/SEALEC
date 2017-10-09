::FOR %x IN (C:\SECMD\Mods\*.bat) DO call "%x"
call autoinstaller.bat
@echo off
call C:\SECMD\Interface\startupsound.bat
title Extended Cmd
set "startuptime=%time%and%date%"
echo %startuptime%>C:\SECMD\LoveLife\startuplog.txt
cls
echo Type +help to see additional utilities
:start
setlocal EnableDelayedExpansion
set "maininputSEAL="
set /p "maininputSEAL= %cd%>"
set "SEALDETECT=%maininputSEAL:~0,1%"
if "%SEALDETECT%"=="+" goto SealConsole

%maininputSEAL%
@echo off
echo.
endlocal
goto start
:SealConsole
echo.
if "%maininputSEAL%"=="+versioninfo" goto info
if "%maininputSEAL%"=="+changelog" goto news
set "SEALDETECT=%maininputSEAL:~0,6%"
if "%SEALDETECT%"=="+range" goto range
set "SEALDETECT=%maininputSEAL:~0,5%"
if "%SEALDETECT%"=="+math" goto math
if "%SEALDETECT%"=="+help" goto help
set "SEALDETECT=%maininputSEAL:~0,9%"
if "%SEALDETECT%"=="+settings" goto settings

echo No Command Found
goto start
:range
set "SEALDETECT2=%maininputSEAL:~7%"

call C:\SECMD\JigglyBits\range.bat %SEALDETECT2%
echo !SRangeC!
goto start
:math
set "SEALDETECT2=%maininputSEAL:~6%"
call C:\SECMD\JigglyBits\MathStuff.bat %SEALDETECT2%
goto start
:help
echo.
type C:\SECMD\Resources\Shelf\help1.txt
pause
goto start
:info
type C:\SECMD\Resources\Shelf\versioninfo.txt
pause
goto start
:news
type C:\SECMD\LoveLife\Version_News.txt
echo.
pause
goto start
:settings
echo.
call C:\SECMD\Resources\ForDevelopers\Formatting\linebreak.bat 12
set "SEALDETECT2=%maininputSEAL:~10%"
echo %SEALDETECT2%
call :settingdetect %SEALDETECT2%
goto start
:settingdetect
::write to preferences
echo NOT FINISHED
pause
exit
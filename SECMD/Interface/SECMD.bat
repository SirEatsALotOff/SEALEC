@echo off
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
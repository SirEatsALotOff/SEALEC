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
set "SEALDETECT=%maininputSEAL:~0,6%"
if "%SEALDETECT%"=="+range" goto range


echo No Command Found
goto start
:range
set "SEALDETECT2=%maininputSEAL:~7%"

call C:\SECMD\JigglyBits\range.bat %SEALDETECT2%
echo !SRangeC!
goto start
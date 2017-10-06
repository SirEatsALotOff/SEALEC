@title EXTENDED CMD (SEAL)
@cls
@IF NOT "%1"=="" (
@set "%1=arg1"
@goto %1
)
@if defined %2 set "%2=arg2"
@if defined %3 set "%3=arg3"
@if defined %4 set "%4=arg4"
@if defined %5 set "%5=arg5"
@if defined %6 set "%6=arg6"
:main
@color 0a
@echo All ExtendedCmd commands start with + (ex. "+help" displays the help menu specifically for EC)
:console
@set "maininput="
@set /p maininput= ~ 
@setlocal enabledelayedexpansion
@set "SEALDETECT=%mainInput:~0,1%"
@if "%SEALDETECT%"=="+" goto SealConsole
%maininput%
@endlocal
@echo.
@goto console
:find
CALL set "test=%%var:%search%=%%"
if "%test%"=="%var%" (echo %search% is not in %var%) else call :%mainInput%
goto :eof
:SealConsole
@echo off
@setlocal enableextensions enabledelayedexpansion
color 0f
echo SEAL COMMAND DETECTED
echo.
echo.
echo _____________________________________________________________________
if "%mainInput%"=="+help" call :SealHelp
if "%mainInput%"=="+execute" call :excecute
set "var=%mainInput%"
set "search=range"
call :find
set "search=help /"
call :find
set "search=execute"
call :find

:find
CALL set "test=%%var:%search%=%%"
if "%test%"=="%var%" (echo %search% is not in %var%) else call :%mainInput%
goto :eof
endlocal
goto SealConsole
:SealHelp
@echo off
if "%1"=="range" goto rangeHelp
if "%1"=="execute" goto executeHelp
if "%1"=="help" goto helpHelp
echo.
echo All ExtendedCmd commands start with "+" (ex. "+help" displays the help menu specifically for EC)
echo.
echo.
type sealhelp.txt
echo.
@echo on
@goto main
:rangeHelp
@echo off
echo RANGE
echo.
echo To call within program, type "call ExtendedCmd.bat "" <Min> <Max> <TestVar>"
echo" Can be called from an outside program by typing "call ExtendedCmd.bat range <Min> <Max> <TestVar>"
echo If you want to exit after excecution, you can type call "ExtendedCmd.bat range <Min> <Max> <TestVar> END"
pause
@echo on

@goto main
:executeHelp

@echo on
@goto main
:helpHelp

@echo on
@goto main
:range
@echo on
set "SRangeC=Not Defined"
if "%4" GEQ "%2" (
	set SRangeC=1
)
if %4 LEQ %3 (
	set /a "SRangeC=%SRangeC%+1"
)
if not "%SRangeC%"=="2" (
	set "SRangeC=0"
)
if %SRangeC%==2 (
	 set "SRangeC=1"
	 goto :main
	
)
if "%5"=="END" goto :eof
@goto main
:excecute
::read text after . like 'hello.txt' would return '.txt'
::if .bat, run normally inside extended CMD
::if .txt or .log, type text into a temporary batch file, and run in inside extended cmd
:write
set "writeVar<%2"
if "%3"=="1" (
echo File: %2
dir %2
echo %writeVar%
)
echo Hi
pause
goto :eof
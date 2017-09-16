@title EXTENDED CMD (SEAL)
@cls
:console
@color 0a

@echo All ExtendedCmd commands start with + (ex. "+help" displays the help menu specifically for EC)
@set "maininput="
@set /p "mainInput= Enter in a command here ~ "

@set "SEALDETECT=%mainInput:~0,1%"
@if "%SEALDETECT%"=="+" goto SealConsole
%maininput%

@echo.
@goto console
:SealConsole
@echo off
@setlocal enableextensions enabledelayedexpansion
color 0f

cls
echo SEAL COMMAND DETECTED
echo.
echo.
echo _____________________________________________________________________
if "%rangeInput%"=="+range" call :%mainInput%
if "%mainInput%"=="+help" call :SealHelp
if "%mainInput%"=="+excecute" call :excecute

set "var=%mainInput%"
set "search=range"
CALL set "test=%%var:%search%=%%"
if "%test%"=="%var%" (echo %search% is not in %var%) else call :%mainInput%

endlocal
goto SealConsole
:SealHelp
@echo off
echo.
echo All ExtendedCmd commands start with "+" (ex. "+help" displays the help menu specifically for EC)
echo.
echo.
type sealhelp.txt

echo.
@echo on
@goto console
:range
@echo on
set "SRangeC=Not Defined"
set arg1=%1
set arg2=%2
set arg3=%3
set startRANGE=%arg1%
set endRANGE=%arg2%
set input=%arg3%
pause
if "%3" GEQ "%1" (
	if "%3" LEQ "%2" (
		set "SRangeC=1"
		goto :eof
	)
) 
if not "%3" GEQ "%1" (
set "SRangeC=0"
)
echo %SRangeC%
pause
goto :console

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
@pause
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
Echo.%1 | findstr /C:"%2">nul && (
    call :range%%
) || (
    REM FALSE
)
if "%mainInput%"=="+help" call :SealHelp
if "%mainInput%"=="+excecute" call :excecute

endlocal
goto SealConsole
:SealHelp
pause
@echo off
echo.
echo All ExtendedCmd commands start with "+" (ex. "+help" displays the help menu specifically for EC)
echo.
echo.
type sealhelp.txt
pause
echo.
@echo on
@goto console
:range
set startRANGE=0
set endRANGE=10
set arg1=%1
set arg2=%2
set arg3=%3
set startRANGE=%arg1%
set endRANGE=%arg2%
set input=%arg3%
pause
if "%input%" GEQ "%startRANGE%" (
	if "%input%" LEQ "%endRANGE%" (
		set "SRangeC=1"
		goto :eof
		
	)
) 
if not "%input%" GEQ "%startRANGE%" (
set "SRangeC=0"
)
echo %SRangeC%
pause
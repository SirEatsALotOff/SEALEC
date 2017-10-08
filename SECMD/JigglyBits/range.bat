@echo off
set "SRangeC=Not Defined"
if "%3" GEQ "%1" (
	set SRangeC=1
)
if %3 LEQ %2 (
	set /a "SRangeC=%SRangeC%+1"
)
if not "%SRangeC%"=="2" (
	set "SRangeC=0"
)
if %SRangeC%==2 (
	 set "SRangeC=1"
	
)
if "%4"=="display" echo %SRangeC%
goto :EOF
::experimental installer
::allows user to not have to manually download the new installer for a release

@echo on
setlocal EnableDelayedExpansion
cls
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/downloadlist.txt downloadlist.txt Users\%username%\Desktop
setlocal enabledelayedexpansion

set Counter=1

::note, no spaces in text
for /f %%x in (downloadlist.txt) do (
  set "Line_!Counter!=%%x"
  set /a Counter+=1
)
set /a NumLines=Counter - 1
for /l %%x in (1,1,%NumLines%) do echo %%x is !Line_%%x!

pause
set /a "NumericalI=%NumLines%/3"
set /a "NumericalO=%NumericalI%
:loop
call :downloadandcopy %Line_2% %Line_1% %Line_3%
set /a "NumericalO=%NumericalO%-1
if %NumericalO%==0 goto end
goto loop
:end
echo GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG
pause

:downloadandcopy
	@echo DOWNLOADING CONTENT...
	powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
	powershell -Command "Invoke-WebRequest %1 -OutFile %2"
	xcopy /s "C:\Users\%username%\Desktop\%2" "%3"

goto :EOF
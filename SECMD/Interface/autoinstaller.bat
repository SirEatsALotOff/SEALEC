::autoupdater
@echo on
setlocal EnableDelayedExpansion
echo Checking for updates...
del C:\SECMD\Interface\versioninfo.txt
set /p CurrentBuild=<C:\SECMD\Resources\Shelf\versioninfo.txt
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Shelf/versioninfo.txt versioninfo.txt Interface
set /p LatestBuild=<C:\SECMD\Interface\versioninfo.txt
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD_installer.bat SECMD_installer.bat Interface
xcopy /s "C:\SECMD\Interface\SECMD_installer.bat" "C:\Users\%username%\Desktop"
if "%CurrentBuild%"=="%LatestBuild%" (
@echo No New Version Detected
goto :EOF
)
setlocal EnableDelayedExpansion
@echo (Y/N)
@set /p "DDDD=Download the most recent version?  "
if "%DDDD%"=="y" goto update
if "%DDDD%"=="Y" goto update
if "%DDDD%"=="n" goto :EOF
if "%DDDD%"=="N" goto :EOF
@echo Error...?
pause
exit
:downloadandcopy
@echo DOWNLOADING CONTENT...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
powershell -Command "Invoke-WebRequest %1 -OutFile %2"
xcopy /s "C:\Users\%username%\Desktop\%2" "C:\SECMD\%3"
del C:\Users\%username%\Desktop\%2
goto :EOF
:update
cls
@call C:\Users\%username%\Desktop\SECMD_installer.bat

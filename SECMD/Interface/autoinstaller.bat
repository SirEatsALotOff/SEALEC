::autoupdater
@echo on
echo Checking for updates...
set /p CurrentBuild=<versioninfo.txt
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Shelf/versioninfo.txt versioninfo.txt Interface
set /p LatestBuild=<C:\SECMD\Interface\versioninfo.txt
if "%CurrentBuild%"=="%LatestBuild%" (
@echo No New Version Detected
goto :EOF
)
@echo (Y/N)
@set /p "DDDD=Download the most recent version?  "
if "%DDDD%"==y call "C:\Users\%username%\Desktop\SECMD installer.bat"
if "%DDDD%"==Y call "C:\Users\%username%\Desktop\SECMD installer.bat"
if "%DDDD%"==n goto :EOF
if "%DDDD%"==N goto :EOF
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
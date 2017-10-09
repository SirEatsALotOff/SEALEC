TITLE Seal Extended CMD Installer
@echo off
cls
echo C:\Users\%username%\Desktop

echo You need to run this program as an administrator for it to work.
echo Also we're assuming you're running this file from the desktop.
echo Reason is I like to store all my jiggly bits in your computers.
echo.
echo Are you sure about this?
echo If you're updating, this will delete all files inside SECMD.
echo We may or may not mess with random system files.
echo Probs not, but what the heck
echo Not responsible for stuff ya do... and uhm...
set confirm=0
echo Agree, Y or N?
set /p "confirm= Y/N ?   "
if %confirm%==Y goto install
if %confirm%==y goto install
if %confirm%==N exit
if %confirm%==n exit
echo Well ok then...
exit
:install
cls
@echo on
if exist C:\SECMD (
RD /s /q C:\SECMD
)
@echo Creating Initial File...
MKDIR C:\SECMD\LoveLife
@echo Hitting ALT+F4...
echo.>"C:\SECMD\LoveLife\startuplog.txt"
@echo Creating Folders...
MKDIR C:\SECMD\Resources\Image
MKDIR C:\SECMD\Resources\Sound
MKDIR C:\SECMD\Resources\Shelf
MKDIR C:\SECMD\Resources\ForDevelopers
MKDIR C:\SECMD\Mods
echo.>"C:\SECMD\Mods\ModList.txt"
MKDIR C:\SECMD\Mods\modHandler
MKDIR C:\SECMD\Resources\ForDevelopers\TimeCapsule
MKDIR C:\SECMD\Interface
MKDIR C:\SECMD\JigglyBits
@echo Righty then, that was the easy part. Hope this drive isn't a potato...
@echo Lol, potato confirmed...
@echo Huh, this download method would be a decent utility...
@echo Welp, chugging on to the next download.
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Interface/SECMD.bat SECMD.bat Interface
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/JigglyBits/range.bat range.bat JigglyBits
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/LoveLife/Version_News.txt Version_News.txt LoveLife
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Shelf/versioninfo.txt versioninfo.txt Resources\Shelf
::Hello
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/JigglyBits/MathStuff.bat MathStuff.bat JigglyBits
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/JigglyBits/timeDifference.bat timeDifference.bat JigglyBits
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Shelf/help1.txt help1.txt Resources\Shelf
@echo Cleaning up mess...
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Sound/chime.bat chime.bat Resources\Sound
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Resources/Sound/startupsound.wav startupsound.wav Resources\Sound
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Interface/startupsound.bat startupsound.bat Interface
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/SECMD/Interface/autoinstaller.bat autoinstaller.bat Interface
@RD /s /q C:\SECMD\Interface\SECMD
@echo Literally I have no idea why it puts these things in there...
@RD /s /q C:\SECMD\JigglyBits\SECMD
@RD /s /q C:\SECMD\LoveLife\SECMD
@echo Probably doubles download times tbh
@echo OK that is weird, mod folder doesn't have it...
@echo Moving on...
@RD /s /q C:\SECMD\Resources\Shelf\SECMD
@RD /s /q C:\SECMD\Resources\Sound\SECMD
::%1 downoad link
::%2 Outfile
::%3 Copy Into
echo.
@echo DONE!
pause
exit
:downloadandcopy
@echo DOWNLOADING CONTENT...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
powershell -Command "Invoke-WebRequest %1 -OutFile %2"
xcopy /s "C:\Users\%username%\Desktop\%2" "C:\SECMD\%3"
del C:\Users\%username%\Desktop\%2
goto :EOF
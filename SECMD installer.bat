TITLE Seal Extended CMD Installer
@echo off
cls
echo C:\Users\%username%\Desktop

echo You need to run this program as an administrator for it to work.
echo Also we're assuming you're running this file from the desktop.
echo Reason is I like to store all my jiggly bits in your computers.
echo.
echo Are you sure about this?
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
MKDIR C:\SECMD\Interface
MKDIR C:\SECMD\JigglyBits
@echo Righty then, that was the easy part. Hope this drive isn't a potato...
call :downloadandcopy https://raw.githubusercontent.com/SirEatsALotOff/SEALEC/master/sealhelp.txt sealhelp.txt resources\Shelf
@echo Lol, potato confirmed...
@echo Huh, this download method would be a decent utility...
@echo Welp, chugging on to the next download.
call :downloadandcopy
::%1 downoad link
::%2 Outfile
::%3 Copy Into
@echo DONE!
pause
exit
:SpecificLine
(
echo hello
) >variables.txt
GOTO :EOF
:downloadandcopy
@echo DOWNLOADING CONTENT...
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
powershell -Command "Invoke-WebRequest %1 -OutFile %2.txt"
xcopy /s "C:\Users\%username%\Desktop\%2" "C:\SECMD\%3"
del C:\Users\%username%\Desktop\%2
goto :EOF
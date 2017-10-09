@echo off
set looper=0
echo.
:linebreak
set /a "looper=%looper%+1"
type "C:\SECMD\Resources\ForDevelopers\Formatting\linebreakchr.txt"
if "%looper%"=="%1" goto :next
goto linebreak
:next
echo.
goto :EOF
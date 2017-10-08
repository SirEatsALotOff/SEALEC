@echo off
title Extended Cmd
set "startuptime=%time%and%date%"
echo %startuptime%>C:\SECMD\LoveLife\startuplog.txt
cls
echo Type +help to see additional utilities
:start
setlocal EnableDelayedExpansion
set "maininputSEAL="
set /p "maininputSEAL= %cd%>"

%maininputSEAL%

@echo off
echo.
endlocal
goto start
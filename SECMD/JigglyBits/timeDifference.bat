@echo off
echo Calculating Time Difference...
::1 start time
::2 end time
::3 how to format time

setlocal EnableDelayedExpansion

::set "startTime=%time: =0%"
set "startTime=%1"
::set /P "=Any process here..."
set "endTime=%2"
::set "endTime=%time: =0%"



rem Get elapsed time:
set "end=!endTime:%time:~8,1%=%%100)*100+1!"  &  set "start=!startTime:%time:~8,1%=%%100)*100+1!"
set /A "elap=((((10!end:%time:~2,1%=%%100)*60+1!%%100)-((((10!start:%time:~2,1%=%%100)*60+1!%%100)"

rem Convert elapsed time to HH:MM:SS:CC format:
set /A "cc=elap%%100+100,elap/=100,ss=elap%%60+100,elap/=60,mm=elap%%60+100,hh=elap/60+100"
set "ElapsedTime=%hh:~1%%time:~2,1%%mm:~1%%time:~2,1%%ss:~1%%time:~8,1%%cc:~1%"
echo %ElapsedTime% is saved as the variable "ElapsedTime"
::downloads a URL
::call C:\SECMD\JigglyBits\downloadURL.bat <URL> <filename> <directory>
::directory is optional. Automatically downloads to desktop.
if defined %1 (
powershell -Command "(New-Object Net.WebClient).DownloadFile('%1', '%2')"
powershell -Command "Invoke-WebRequest %1 -OutFile %2"
)
if defined "%3" (
xcopy /s "C:\Users\%username%\Desktop\%2" "C:\SECMD\%3"
del C:\Users\%username%\Desktop\%2
)
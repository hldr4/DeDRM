@echo off
rem delete the registy key controlling KFX downloads

reg delete "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported" /f

rem start K4PC from the default location or admin install location.  This can be modified for non-standard installs
rem the "" sets the title for the DOS box.  This was needed when the location for the segment
rem that starts K4PC had a user name with an embedded space requiring the "...." wrapper

set KINDLE=%LocalAppData%\Amazon\Kindle
set KINDLE_EXE=%PROGRAMFILES(X86)%\Amazon\Kindle

cd "%KINDLE%"

if not exist "%KINDLE_EXE%\Kindle.exe" goto :next
start "" "%KINDLE_EXE%\kindle.exe"
goto :repeat

:next
if not exist "%KINDLE%\application\Kindle.exe" goto :error
start "" "%KINDLE%\application\kindle.exe"

rem this loop waits for the isKRFDRendererSupported key to be created
:repeat
timeout 1
reg query "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported"
if ERRORLEVEL 1 goto :repeat

rem when we arrive here, the key has been created, replace it with a version that does not allow KFX downloads
reg add "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported" /t REG_SZ /d "false" /f
goto :ender

:error
echo Could not start Kindle4PC from either location tried.

:ender
rem  wait for any key to be hit to close the command windows.  remove the pause statement to auto-close
pause
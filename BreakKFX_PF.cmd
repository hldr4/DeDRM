reg delete "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported" /f
start "" "C:\Program Files (x86)\Amazon\Kindle\Kindle.exe"
:repeat
timeout 3
reg query "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported"
if ERRORLEVEL 1 goto :repeat
reg add "HKEY_CURRENT_USER\SOFTWARE\Amazon\Kindle\User Settings" /v "isKRFDRendererSupported" /t REG_SZ /d "false" /f


PAUSE
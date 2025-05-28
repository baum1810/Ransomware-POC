@echo off
SETLOCAL EnableDelayedExpansion

SET "PASSWORD=test123"
SET "DESKTOP_PATH=%USERPROFILE%\Desktop"

SET "SEVEN_ZIP_PATH=C:\Program Files\7-Zip\7z.exe"
FOR %%A IN ("%DESKTOP_PATH%\*.lol") DO (
    ECHO decrypting: %%~nxA
    "%SEVEN_ZIP_PATH%" x "%%~fA" -p%PASSWORD% -y -o"%DESKTOP_PATH%" >nul
    del /q "%%~fA"
)

ECHO Done decrypting all archives and deleting .lol files.
ENDLOCAL

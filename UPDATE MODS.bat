@echo off
setlocal enabledelayedexpansion

powershell.exe -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/haydenrh77/LethalCompanyMods/main/version -OutFile version"
set /p version=< version
powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/BepInEx/BepInExPack/5.4.2100/ -OutFile BepInEx.zip"
powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/notnotnotswipez/MoreCompany/%version%/ -OutFile MoreCompany.zip"


powershell -Command "Expand-Archive BepInEx.zip -DestinationPath temp\BepInEx"
powershell -Command "Expand-Archive MoreCompany.zip -DestinationPath temp\MoreCompany"

xcopy "temp\BepInEx\BepInExPack\*" ".\*" /E /Y
xcopy "temp\MoreCompany\BepInEx" "BepInEx\" /E /Y

del /s /q .\temp
@RD /S /Q ".\temp"
del version
del BepInEx.zip
del MoreCompany.zip

endlocal
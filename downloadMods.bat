@echo off

powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/BepInEx/BepInExPack/5.4.2100/ -OutFile BepInEx.zip"
powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/notnotnotswipez/MoreCompany/1.4.1/ -OutFile MoreCompany.zip"

pause
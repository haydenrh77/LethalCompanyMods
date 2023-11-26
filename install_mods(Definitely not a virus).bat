@echo off
setlocal enabledelayedexpansion

if not exist "PortableGit\" (
    powershell -Command "Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/PortableGit-2.43.0-64-bit.7z.exe -OutFile package.zip"
	.\PortableGit-2.39.2-64-bit.7z.exe -o "PortableGit" -y
	.\PortableGit\bin\git.exe init .
	.\PortableGit\bin\git.exe remote add origin https://github.com/haydenrh77/EldenRingMods.git
	.\PortableGit\bin\git.exe fetch --all
	.\PortableGit\bin\git.exe reset --hard origin/main
	
	.\PortableGit\bin\git.exe pull origin main
)



REM Fetch the remote changes
git fetch

REM Check if there are any changes to pull
for /f "tokens=1,2" %%A in ('git rev-list HEAD...origin/main --count') do set "changes=%%B"

if %changes% gtr 0 (
    echo Repository needs to pull changes.
    REM You can add the command to pull changes here, for example:
    .\PortableGit\bin\git.exe pull origin main
) else (
    echo Repository is up to date.
)

endlocal
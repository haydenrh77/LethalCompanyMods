@echo off
setlocal enabledelayedexpansion

if not exist "PortableGit\" (
    powershell -Command "Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/PortableGit-2.43.0-64-bit.7z.exe -OutFile PortableGit-2.39.2-64-bit.7z.exe"
	.\PortableGit-2.39.2-64-bit.7z.exe -o "PortableGit" -y
    del PortableGit-2.39.2-64-bit.7z.exe
	.\PortableGit\bin\git.exe init .
	.\PortableGit\bin\git.exe remote add origin https://github.com/haydenrh77/LethalCompanyMods.git
	.\PortableGit\bin\git.exe fetch --all
	.\PortableGit\bin\git.exe reset --hard origin/main
	
	.\PortableGit\bin\git.exe pull origin main
)



.\PortableGit\bin\git.exe pull origin main
powershell "start downloadMods.bat"
timeout /t 5 /nobreak >nul
rem del downloadMods.bat

pause
endlocal
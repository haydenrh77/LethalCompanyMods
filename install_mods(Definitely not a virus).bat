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



REM Fetch the remote changes
.\PortableGit\bin\git.exe fetch

powershell -Command "& { .\PortableGit\bin\git.exe fetch; $changes = ( .\PortableGit\bin\git.exe rev-list HEAD...origin/main --count); if ($changes -gt 0) { .\PortableGit\bin\git.exe pull; Write-Host 'Repository updated. Restarting the script...'; Start-Sleep -Seconds 3; Restart-Process -FilePath '%~f0'; exit } else { Write-Host 'Repository is up to date.' }}"

powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/BepInEx/BepInExPack/5.4.2100/ -OutFile BepInEx.zip"
powershell -Command "Invoke-WebRequest https://thunderstore.io/package/download/notnotnotswipez/MoreCompany/1.4.1/ -OutFile MoreCompany.zip"

pause
endlocal
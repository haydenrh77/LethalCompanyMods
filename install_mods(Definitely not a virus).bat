@echo off
setlocal enabledelayedexpansion

set "git_path=.\PortableGit\bin\git.exe"

if not exist "PortableGit\" (
    powershell -Command "Invoke-WebRequest https://github.com/git-for-windows/git/releases/download/v2.43.0.windows.1/PortableGit-2.43.0-64-bit.7z.exe -OutFile package.zip"
	%git_path% -o "PortableGit" -y
	%git_path% init .
	%git_path% remote add origin https://github.com/haydenrh77/EldenRingMods.git
	%git_path% fetch --all
	%git_path% reset --hard origin/main
	
	%git_path% pull origin main
)



REM Fetch the remote changes
%git_path% fetch

powershell -Command "& { %git_path% fetch; $changes = ( %git_path% rev-list HEAD...origin/main --count); if ($changes -gt 0) { %git_path% pull; Write-Host 'Repository updated. Restarting the script...'; Start-Sleep -Seconds 3; Restart-Process -FilePath '%~f0'; exit } else { Write-Host 'Repository is up to date.' }}"

pause
endlocal
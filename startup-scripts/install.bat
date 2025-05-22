@echo off
echo ========================================
echo Setup for BC Container 
echo ========================================

echo Copying createbccontainer.ps1 to Desktop
copy "C:\OEM\createcontainer.ps1" "%USERPROFILE%\Desktop\createcontainer.ps1"
echo Successfully copied createcontainer.ps1 to Desktop

echo Copying init-code-tunnel.bat to startup folder
set startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
copy "C:\OEM\init-code-tunnel.bat" "%startupFolder%\init-code-tunnel.bat"
echo Successfully copied init-code-tunnel.bat to startup folder

echo Disabling Ctrl+Alt+Del for login...
powershell -Command "Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name "DisableCAD" -Value 1"
echo Successfully disabled Ctrl+Alt+Del

echo Disabling Windows Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
powershell -Command "Remove-WindowsFeature Windows-Defender"
echo Successfully disabled Windows Defender

echo Installing NuGet
powershell -Command "Install-PackageProvider -Name NuGet -Force"
echo Successfully installed NuGet

echo Installing Git and Github
powershell -Command "winget install --id Git.Git -h -e --source winget --accept-source-agreements --accept-package-agreements"
powershell -Command "winget install --id GitHub.cli -h --accept-source-agreements --accept-package-agreements"
echo Successfully installed Git and GitHub CLI

echo Installing VS Code
powershell -Command "winget install vscode"
echo Successfully installed VS Code

echo Installing BcContainerHelper
powershell -Command "Install-Module -Name BcContainerHelper -Force"
echo Successfully installed BcContainerHelper

echo Enabling Hyper-V without restarting directly
powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart"
echo Successfully enabled Hyper-V

echo Installing Docker...
powershell -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1' -o install-docker-ce.ps1"
powershell -Command ".\install-docker-ce.ps1"

@echo off
echo ========================================
echo Setup for BC Container 
echo ========================================

echo Disabling Windows Defender...
powershell -Command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo Successfully disabled Windows Defender

echo Installing NuGet
powershell -Command "Install-PackageProvider -Name NuGet -Force"
echo Successfully installed NuGet

echo Installing BcContainerHelper
powershell -Command "Install-Module -Name BcContainerHelper -Force"
echo Successfully installed BcContainerHelper

echo Installing Docker...
powershell -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1' -o install-docker-ce.ps1"
powershell -Command ".\install-docker-ce.ps1"
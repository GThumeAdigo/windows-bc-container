@echo off
echo ========================================
echo Setup for BC Container 
echo ========================================

echo Installing NuGet and BcContainerHelper...
powershell -Command "Install-PackageProvider -Name NuGet -Force"
powershell -Command "Install-Module -Name BcContainerHelper -Force"

echo Installing Docker...
powershell -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1' -o install-docker-ce.ps1"
powershell -Command ".\install-docker-ce.ps1"
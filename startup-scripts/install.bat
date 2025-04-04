@echo off
echo ========================================
echo Windows Container Setup
echo ========================================

@REM REM Install Docker on Windows

@REM echo Enabling Windows Container features...
@REM REM Enable the containers feature
@REM dism /online /enable-feature /all /featurename:Containers /norestart

echo Installing Hyper-V...
REM Download and install Hyper-V Feature
powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -Force -NoRestart"

echo Installing Docker...
REM Download and install Docker
powershell -Command "Invoke-WebRequest -UseBasicParsing 'https://raw.githubusercontent.com/microsoft/Windows-Containers/Main/helpful_tools/Install-DockerCE/install-docker-ce.ps1' -o install-docker-ce.ps1"
powershell -Command ".\install-docker-ce.ps1"

echo Installing Container Helper Modules...
REM Install NuGet and BcContainerHelper
powershell -Command "Install-PackageProvider -Name NuGet -Force"
powershell -Command "Install-Module -Name BcContainerHelper -Force"

echo.
echo Installation abgeschlossen!
echo.
echo Nach dem Neustart können Sie den Business Central Container mit diesem Befehl erstellen:
echo powershell -Command ".\createcontainer.ps1"
echo.
echo System wird in 10 Sekunden neu gestartet...
timeout /t 10
shutdown /r /t 0
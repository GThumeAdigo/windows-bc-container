# Windows Container for Docker

A containerized Windows environment that runs on Linux using Docker, providing easy access to containerized BC development, Windows applications and services.

## Overview

This project allows you to run a BC container in a Windows virtual machine inside a Docker container. It's perfect for BC development, testing, and running Windows-specific applications.

## Features

- Windows running in a containerized environment
- Script to create BC Container on Desktop
- RDP access to the Windows desktop (port 3389)
- Configurable hardware resources (RAM, CPU, disk)
- Shared volumes for data exchange
- Support for Business Central ports (7047-7049)
- Custom startup scripts support (currently installing BC Container dependencies)
- Network bridge configuration for seamless integration
- Installation working out of the Box with no changes to the docker-compose file
- Takes about 30 minutes, depending on download speed

## Prerequisites

- Linux host with Docker and Docker Compose installed
- KVM virtualization support
- At least 8GB RAM recommended

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/windows-bc-container.git
   cd windows-bc-container
   ```

2. Start the container:
   ```bash
   docker-compose up -d
   ```

3. Connect to the Windows container:

   **Via Web Browser (noVNC):**
   - Open http://127.0.0.1:8006 in your browser
   - No additional software required
   - *can be used while installation to check status*
   
   **Via RDP:**
   - Host: localhost or your server IP
   - Port: 3389
   - Username: adigo
   - Password: adigo
   - provides a smoother UX with copy/paste & screen resolution

4. **Install the Business Central container:**
   - Once connected to Windows, execute the PowerShell script (`createcontainer.ps1`) located on the desktop
   - Wait for the BC container setup to complete

5. **Use the BC Container in your Host PC**
   - Now you should be able to access the Business Central Container on your Host machines browser or with the ip in your launch.json
   - The ip set in the compose-file
   - Default IP is "http://127.0.0.1/"
   - Default credentials are adigo:adigo, can be changed in createcontainer.ps1 script

## Configuration Options

Edit the `docker-compose.yml` file to customize your Windows environment:

| Parameter | Description | Default |
|-----------|-------------|---------|
| VERSION | Windows version | 25 |
| REGION | System locale | de-DE |
| KEYBOARD | Keyboard layout | de-DE |
| RAM_SIZE | Memory allocation | 16G |
| CPU_CORES | CPU cores | 8 |
| DISK_SIZE | Disk space | 64G |
| USERNAME | Windows user | adigo |
| PASSWORD | User password | adigo |

[Official Readme for configuration examples](https://github.com/dockur/windows?tab=readme-ov-file)

## Volume Mounts

- `/storage`: Persistent storage for Windows
- `/data`: Data exchange between host and container
- `/oem`: Custom startup scripts

## Networking

The container uses a bridge network with a predefined subnet. You can access the Windows environment through mapped ports:

- noVNC: 8006
- RDP: 3389 (TCP/UDP)
- Web for BC: 80, 443, 8080
- Business Central Dev: 7047, 7048, 7049

## Troubleshooting

- Ensure KVM is available on your host
- Check that you have sufficient RAM available
- For performance issues, try adjusting the CPU/RAM parameters

## Acknowledgements

This project uses the Windows container image from dockurr/windows.
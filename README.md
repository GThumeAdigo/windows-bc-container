# Windows Container for Docker

A containerized Windows environment that runs on Linux using Docker, providing easy access to containerized Microsoft Dynamics 365 Business Central (BC) development, Windows applications and services.

## Overview

This project allows you to run a BC container in a Windows virtual machine inside a Docker container. It's perfect for BC development, testing, and running Windows-specific applications.

## Features

- Windows running in a containerized environment
- Pre-configured setup for Business Central development
- Easy access via RDP or web browser (noVNC)
- Configurable hardware resources (RAM, CPU, disk)
- Shared volumes for data exchange
- Automatic port forwarding for BC services (7047-7049)
- Custom startup scripts support
- Network bridge configuration for seamless integration
- Installation working out of the Box with no configuration needed
- Setup time: ~20 minutes (depending on download speed)

## Prerequisites

- Linux host with Docker and Docker Compose installed
- KVM virtualization support
- At least 8GB RAM recommended (16GB for optimal performance)

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/GThumeAdigo/windows-bc-container.git
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
   - *Useful for monitoring installation status*
   
   **Via RDP:**
   - Use for example Remmina on Linux
   - Host: localhost or your server IP
   - Port: 3389
   - Username: adigo
   - Password: adigo
   - Provides better experience with copy/paste & screen resolution

4. **Install the Business Central container:**
   - Once connected to Windows, execute the PowerShell script (`createcontainer.ps1`) located on the desktop
   - Wait for the BC container setup to complete

5. **Access Business Central:**
   - From your host PC's browser: http://127.0.0.1/BC/
   - In VS Code: use this IP in your launch.json
   - Default credentials: adigo/adigo (can be changed in createcontainer.ps1)
   - The IP can be changed in the compose-file

## Managing the Container
**To stop the container:**
```bash
docker-compose stop
```

**To remove the container:**
```bash
docker-compose down
```


## Configuration Options

Edit the `docker-compose.yml` file to customize your Windows environment:

| Parameter | Description | Default |
|-----------|-------------|---------|
| VERSION | Windows version | 25 |
| REGION | System locale | de-DE |
| KEYBOARD | Keyboard layout | de-DE |
| RAM_SIZE | Memory allocation | 24G |
| CPU_CORES | CPU cores | 12 |
| DISK_SIZE | Disk space | 64G |
| USERNAME | Windows user | adigo |
| PASSWORD | User password | adigo |

For more configuration options, see the [dockur/windows documentation.](https://github.com/dockur/windows)

## Volume Mounts

- `/storage`: Persistent storage for Windows
- `/data`: Data exchange between host and container
- `/oem`: Custom startup scripts

## Networking

The container uses a bridge network with a predefined subnet. You can access the Windows environment through mapped ports:

- **Web Access:** noVNC (8006)
- **Remote Desltop:** RDP (3389 TCP/UDP)
- **Business Central Web:** 80, 443, 8080
- **Business Central Develpoment:** 7047, 7048, 7049

## Troubleshooting

- Ensure KVM is available on your host system
- Check that you have sufficient RAM available
- For performance issues, try adjusting the CPU/RAM parameters

## Acknowledgements

This project uses the [dockur/windows](https://github.com/dockur/windows) container image. 
Visit their repository for additional configuration parameters and options that can be used in your docker-compose file.

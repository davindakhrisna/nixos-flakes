<p align="center">
  <img src=".github/assets/logo.png" alt="NixOS Configuration Logo" width="200" />
</p>

<h1 align="center">NixOS Configuration</h1>

This repository contains a modular NixOS configuration built with Flakes and Home Manager. It manages system-level configurations, hardware-specific setups, and user environments (including Hyprland, Waybar, TUI tools, and server configurations) across multiple hosts.

## Available Hosts

This flake defines the following hosts:

- **`powerhouse`**: Primary workstation configuration, featuring a Hyprland desktop environment, NVIDIA GPU support, and heavy development/gaming tools.
- **`portable`**: Laptop configuration, optimized for battery life, portability, and Wayland desktop usage.
- **`server`**: Headless server configuration featuring Samba NAS, Nextcloud, Immich, Glance, and secure SSH setups.
- **`vm`**: Virtual machine configuration for testing and isolated development.

---

## Installation Guide

Before installing, ensure you have enabled Flakes in your NixOS configuration. The system expects this repository to be cloned to `~/Documents/Nixos-Config`.

### Method 1: Fresh NixOS Installation (No Desktop / TTY)

If you have just installed a minimal NixOS system without a desktop environment and rebooted into your new system:

1. **Log in** to your user account (e.g., `kryisnn`).
2. **Clone this repository** into the expected directory:
   ```bash
   mkdir -p ~/Documents
   git clone https://github.com/kryisnn/Nixos-Config.git ~/Documents/Nixos-Config
   cd ~/Documents/Nixos-Config
   ```
3. **Copy your hardware configuration**:
   During your minimal install, NixOS generated a hardware profile. Copy it to the host you intend to use:
   ```bash
   cp /etc/nixos/hardware-configuration.nix hosts/<your-host>/hardware-configuration.nix
   ```
4. **Build and switch** to the new configuration:
   ```bash
   sudo nixos-rebuild switch --flake .#<your-host>
   ```
5. **Reboot** to initialize the full desktop environment or server services.

### Method 2: Installation from a NixOS Graphical Installer (Live USB)

If you are currently booted into the NixOS Live USB and want to install directly from this flake onto a fresh drive:

1. **Partition and format your disks**, then mount your target root partition to `/mnt` (and your boot partition to `/mnt/boot`).
2. **Generate the hardware configuration** for the target system:
   ```bash
   sudo nixos-generate-config --root /mnt
   ```
3. **Clone the repository** (temporarily, to the live environment):
   ```bash
   git clone https://github.com/kryisnn/Nixos-Config.git /tmp/Nixos-Config
   cd /tmp/Nixos-Config
   ```
4. **Copy the generated hardware configuration** into the flake:
   ```bash
   cp /mnt/etc/nixos/hardware-configuration.nix hosts/<your-host>/hardware-configuration.nix
   ```
5. **Install NixOS** using the flake:
   ```bash
   sudo nixos-install --flake .#<your-host>
   ```
6. **Set a password** for the user/root when prompted by the installer.
7. **Reboot** and log into your new system. Make sure to re-clone the repository to `~/Documents/Nixos-Config` in your actual user environment for future updates!

---

## Updating the System

To pull the latest changes and upgrade packages:
```bash
cd ~/Documents/Nixos-Config
nix flake update
sudo nixos-rebuild switch --flake .#<your-host>
```

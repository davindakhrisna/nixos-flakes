# Syncthing file synchronization configuration for NixOS
{config, ...}: let
  username = config.var.username;
in {
  services.syncthing = {
    enable = true;
    user = username;
    dataDir = "/home/${username}";
    configDir = "/home/${username}/.config/syncthing";

    # Open standard sync ports (22000 TCP/UDP for transfers, 21027 UDP for discovery)
    openDefaultPorts = true;

    # Listen on all interfaces so the Web GUI can be accessed remotely over Tailscale or LAN
    guiAddress = "0.0.0.0:8384";

    # Keep folders and devices manageable dynamically via the Web GUI
    overrideFolders = false;
    overrideDevices = false;
  };
}

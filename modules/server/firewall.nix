# Server Firewall configuration
{
  networking.firewall = {
    enable = true;
    allowPing = false;

    # Trust Tailscale network interface entirely
    trustedInterfaces = ["tailscale0"];

    # Open service ports for local LAN / direct access
    allowedTCPPorts = [
      22 # SSH
      80 # HTTP / Nextcloud
      443 # HTTPS / Nextcloud
      2283 # Immich Web
      5000 # OPDS minimal-books
      5678 # Glance Dashboard
      139 # Samba NetBIOS
      445 # Samba SMB
      5357 # WSDD Web Services Discovery
    ];

    allowedUDPPorts = [
      137 # Samba NetBIOS Name Service
      138 # Samba NetBIOS Datagram
      3702 # WSDD WS-Discovery
      5353 # Avahi / mDNS
    ];
  };
}

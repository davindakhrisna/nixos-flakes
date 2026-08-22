# Tailscale mesh VPN configuration for NixOS
{pkgs, ...}: {
  environment.systemPackages = [pkgs.tailscale];

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  networking.firewall = {
    # Open the default Tailscale port for direct peer-to-peer connections
    allowedUDPPorts = [41641];
    # Trust traffic from Tailscale peers
    trustedInterfaces = ["tailscale0"];
  };
}

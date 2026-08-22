# Aggregated server modules
{ ... }: {
  imports = [
    ./firewall.nix
    ./fail2ban.nix
    ./glance.nix
    ./immich.nix
    ./nextcloud.nix
    ./samba.nix
    ./opds.nix
    ./ssh.nix
  ];
}

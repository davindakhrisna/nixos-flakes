# Nextcloud Private Cloud Suite
{
  pkgs,
  config,
  lib,
  ...
}: let
  hostname = config.var.hostname;
  storageDir = config.var.storageDirectory;
  username = config.var.username;
in {
  services.nextcloud = {
    enable = true;
    package = pkgs.nextcloud30;
    hostName = "${hostname}.local";
    datadir = "${storageDir}/nextcloud";

    # Automatic PostgreSQL setup
    config = {
      dbtype = "pgsql";
      adminuser = username;
      adminpassFile = "/etc/nextcloud-admin-pass";
      extraTrustedDomains = [
        "localhost"
        "127.0.0.1"
        "${hostname}"
        "${hostname}.local"
      ];
    };

    configurePostgreSQL = true;

    # Performance optimizations & caching
    caching.redis = true;
    caching.apcu = true;

    # Large upload support
    maxUploadSize = "16G";

    settings = {
      overwriteprotocol = "http";
      default_phone_region = "ID";
      maintenance_window_start = 1;
    };
  };

  # Provide a fallback default password file if one does not exist
  systemd.services.nextcloud-setup = {
    preStart = ''
      if [ ! -f /etc/nextcloud-admin-pass ]; then
        echo "admin" > /etc/nextcloud-admin-pass
        chmod 600 /etc/nextcloud-admin-pass
      fi
    '';
  };
}

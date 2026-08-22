# Samba NAS & Network Discovery
{
  config,
  ...
}: let
  storageDir = config.var.storageDirectory;
  username = config.var.username;
in {
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "${config.var.hostname} Samba NAS";
        "netbios name" = config.var.hostname;
        "security" = "user";
        "hosts allow" = "192.168. 10. 172. 100. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
        "guest account" = "nobody";
        "map to guest" = "bad user";
      };

      # Public shared folder
      "Shares" = {
        "path" = "${storageDir}/shares";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "yes";
        "create mask" = "0644";
        "directory mask" = "0755";
      };

      # Authenticated user private storage
      "Storage" = {
        "path" = "${storageDir}/private";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "valid users" = username;
        "create mask" = "0600";
        "directory mask" = "0700";
      };
    };
  };

  # Windows Network Discovery (WSDD)
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };

  # Apple / Linux mDNS Auto-Discovery (Avahi)
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
    publish = {
      enable = true;
      userServices = true;
    };
  };
}

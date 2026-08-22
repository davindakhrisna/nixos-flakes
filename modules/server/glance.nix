# Glance Dashboard configuration
{
  config,
  ...
}: {
  services.glance = {
    enable = true;
    settings = {
      server = {
        port = 5678;
        host = "0.0.0.0";
      };

      pages = [
        {
          name = "Dashboard";
          columns = [
            {
              size = "full";
              widgets = [
                {
                  type = "server-stats";
                  servers = [
                    {
                      type = "local";
                      name = config.var.hostname;
                    }
                  ];
                }
                {
                  type = "group";
                  widgets = [
                    {
                      type = "monitor";
                      title = "Self-Hosted Services";
                      cache = "1m";
                      sites = [
                        {
                          title = "Immich Photos";
                          url = "http://localhost:2283";
                          icon = "si:googlephotos";
                        }
                        {
                          title = "Nextcloud";
                          url = "http://localhost";
                          icon = "si:nextcloud";
                        }
                        {
                          title = "Minimal Books (OPDS)";
                          url = "http://localhost:5000";
                          icon = "si:read-the-docs";
                        }
                        {
                          title = "Samba NAS";
                          url = "smb://${config.var.hostname}";
                          icon = "si:files";
                        }
                      ];
                    }
                  ];
                }
                {
                  type = "bookmarks";
                  groups = [
                    {
                      title = "Local Network & Administration";
                      same-tab = false;
                      color = "245 50 64";
                      links = [
                        {
                          title = "Nextcloud";
                          url = "http://${config.var.hostname}.local";
                        }
                        {
                          title = "Immich";
                          url = "http://${config.var.hostname}.local:2283";
                        }
                        {
                          title = "OPDS Minimal Books";
                          url = "http://${config.var.hostname}.local:5000";
                        }
                        {
                          title = "Tailscale Admin";
                          url = "https://login.tailscale.com/admin";
                        }
                      ];
                    }
                  ];
                }
              ];
            }
          ];
        }
      ];
    };
  };
}

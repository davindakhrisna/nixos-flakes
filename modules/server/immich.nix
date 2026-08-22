# Immich Photo & Video Management
{
  config,
  ...
}: {
  services.immich = {
    enable = true;
    host = "0.0.0.0";
    port = 2283;
    openFirewall = true;
    mediaLocation = "${config.var.storageDirectory}/photos";
  };
}

{
  config,
  ...
}: {
  imports = [
    ../../core/defaults.nix
    ../../modules/server/defaults.nix
    ../../modules/home/home-manager.nix
    ./hardware-configuration.nix
  ];

  var = {
    hostname = "jack";
    username = "kryisnn";
    keyboardLayout = "us";
    timeZone = "Asia/Jakarta";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    autoUpgrade = false;
    autoGarbageCollector = true;
    storageDirectory = "/data";

    git = {
      username = "kryisnn";
      email = "kryisnn@users.noreply.github.com";
    };

    # Hardware specs
    cpu = "intel";
    gpu = null;
  };

  home-manager.users."${config.var.username}" = import ./home.nix;

  system.stateVersion = "26.05";
}

# Runs portable host in a VM
{
  config,
  ...
}: {
  imports = [
    ../../core/defaults.nix
    ../../modules/system/defaults.nix
    ../../modules/home/home-manager.nix
    ./hardware-configuration.nix
  ];

  config.var = {
    hostname = "vm-nixos";
    username = "kryisnn";
    keyboardLayout = "us";
    timeZone = "Asia/Jakarta";
    defaultLocale = "en_US.UTF-8";
    extraLocale = "en_US.UTF-8";
    autoUpgrade = false;
    autoGarbageCollector = true;

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

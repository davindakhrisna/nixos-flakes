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

  var = {
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

  boot.loader = {
    limine.enable = false;
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  system.stateVersion = "26.05";
}

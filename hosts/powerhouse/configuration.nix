{ ... }: {
  imports = [
    ../../core/defaults.nix
  ];

  config.var = {
    hostname = "AN515-57";
    username = "kryisnn";

    # CHANGE: Depends on your hardware specs
    cpu = "intel";
    gpu = "nvidia";
  };
}

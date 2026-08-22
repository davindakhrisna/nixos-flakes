# Runs portable host in a VM
{ ... }: {
  imports = [
    ../../core/defaults.nix
  ];

  config.var = {
    hostname = "vm-nixos";
    username = "kryisnn";

    # CHANGE : Depends on your specs
    cpu = "intel";    # Or "amd"
    gpu = null;       # Leaves discrete GPU drivers off
  };
}

# Common core system modules shared across all hosts
{lib, ...}: {
  # Global configuration variables option (CPU, GPU, username, hostname, etc.)
  options.var = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Global configuration variables for system and hosts";
  };

  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./fonts.nix
    ./users.nix
    ./essentials/nix.nix
    ./essentials/vulnix.nix
    ./essentials/tailscale.nix
    ./hardware/boot/kernel-hardening.nix
    ./hardware/boot/limine-boot.nix
    ./hardware/boot/tuigreet.nix
    ./hardware/cpu/amd.nix
    ./hardware/cpu/intel.nix
    ./hardware/gpu/amd.nix
    ./hardware/gpu/nvidia.nix
  ];
}

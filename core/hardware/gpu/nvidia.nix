# Nvidia GPU configuration for NixOS with Wayland and Hyprland support
{
  config,
  lib,
  pkgs,
  ...
}: let
  enable = (config.var.gpu or null) == "nvidia";
  nvidiaDriverChannel = config.boot.kernelPackages.nvidiaPackages.production;
in {
  config = lib.mkIf enable {
    services.xserver.videoDrivers = ["nvidia"];

    boot.kernelParams = [
      "nvidia.NVreg_PreserveVideoMemoryAllocations=1" # Improves resume after sleep
    ];

    environment.variables = {
      LIBVA_DRIVER_NAME = "nvidia";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      __GL_GSYNC_ALLOWED = "1";
      __GL_VRR_ALLOWED = "1";
      NVD_BACKEND = "direct";
    };

    nixpkgs.config.nvidia.acceptLicense = true;

    hardware = {
      nvidia = {
        open = true; # Open kernel modules for Turing / Ada Lovelace and newer (RTX 2000+)
        nvidiaSettings = true;
        powerManagement = {
          enable = true;
          finegrained = false;
        };
        modesetting.enable = true;
        package = nvidiaDriverChannel;
      };

      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [
          nvidia-vaapi-driver
          libva-vdpau-driver
          libvdpau-va-gl
          egl-wayland
          vulkan-loader
          libva
        ];
      };
    };

    # Binary cache for CUDA packages
    nix.settings = {
      substituters = ["https://cuda-maintainers.cachix.org"];
      trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    environment.systemPackages = with pkgs; [
      vulkan-tools
      mesa-demos
      libva-utils
    ];
  };
}

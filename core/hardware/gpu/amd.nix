# AMD GPU configuration for NixOS with Mesa RADV and ROCm support
{
  config,
  lib,
  pkgs,
  ...
}: let
  enable = (config.var.gpu or null) == "amd";
in {
  config = lib.mkIf enable {
    services.xserver.videoDrivers = ["amdgpu"];

    boot.initrd.kernelModules = ["amdgpu"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd # OpenCL compute support
        libvdpau-va-gl
        libva-vdpau-driver
        vaapiVdpau
      ];
      extraPackages32 = with pkgs; [
        driversi686Linux.libvdpau-va-gl
        driversi686Linux.vaapiVdpau
      ];
    };

    environment.systemPackages = with pkgs; [
      clinfo
      vulkan-tools
      glxinfo
    ];
  };
}

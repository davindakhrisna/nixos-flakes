# Intel CPU configuration for NixOS
{
  config,
  lib,
  ...
}: let
  enable = (config.var.cpu or null) == "intel";
in {
  config = lib.mkIf enable {
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    boot = {
      kernelModules = ["kvm-intel"];
    };
  };
}

# AMD CPU configuration for NixOS
{
  config,
  lib,
  ...
}: let
  enable = (config.var.cpu or null) == "amd";
in {
  config = lib.mkIf enable {
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

    boot = {
      kernelModules = ["kvm-amd"];
      kernelParams = ["amd_pstate=active"];
    };
  };
}

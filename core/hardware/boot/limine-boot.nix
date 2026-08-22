# Limine bootloader configuration for NixOS
{pkgs, ...}: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      limine = {
        enable = true;
        extraEntries = ''
          /Windows 10
            protocol: efi
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
      };
    };
    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_zen; # _latest, _zen, _hardened, _rt, _rt_latest, etc.

    # Silent boot
    kernelParams = [
      "quiet"
      "splash"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
      "boot.shell_on_fail"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };

  # To avoid systemd services hanging on shutdown
  systemd.settings.Manager = {
    DefaultTimeoutStopSec = "10s";
  };
}

# Common core system modules shared across all hosts
{
  lib,
  config,
  ...
}: {
  # Global configuration variables option (CPU, GPU, username, hostname, etc.)
  options.var = lib.mkOption {
    type = lib.types.submodule {
      options = {
        username = lib.mkOption {
          type = lib.types.str;
          default = "kryisnn";
          description = "Primary user username";
        };
        hostname = lib.mkOption {
          type = lib.types.str;
          default = "nixos";
          description = "System hostname";
        };
        timeZone = lib.mkOption {
          type = lib.types.str;
          default = "America/New_York";
          description = "System timezone";
        };
        defaultLocale = lib.mkOption {
          type = lib.types.str;
          default = "en_US.UTF-8";
          description = "Default system locale";
        };
        extraLocale = lib.mkOption {
          type = lib.types.str;
          default = "en_US.UTF-8";
          description = "Extra locale settings";
        };
        keyboardLayout = lib.mkOption {
          type = lib.types.str;
          default = "us";
          description = "Console & X11 keyboard layout";
        };
        configDirectory = lib.mkOption {
          type = lib.types.str;
          default = "/home/${config.var.username}/Documents/Nixos-Config";
          description = "Path to the NixOS configuration repository";
        };
        autoUpgrade = lib.mkOption {
          type = lib.types.bool;
          default = false;
          description = "Enable automatic daily system upgrades via flake";
        };
        autoGarbageCollector = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "Enable automatic weekly Nix garbage collection";
        };
        cpu = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "CPU manufacturer (intel or amd)";
        };
        gpu = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "Discrete GPU manufacturer (nvidia or amd)";
        };
        domain = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "Server domain name for cloudflared / reverse proxy";
        };
        tunnelId = lib.mkOption {
          type = lib.types.nullOr lib.types.str;
          default = null;
          description = "Cloudflare tunnel UUID";
        };
        git = lib.mkOption {
          type = lib.types.submodule {
            options = {
              username = lib.mkOption {
                type = lib.types.str;
                default = config.var.username;
                description = "Git commit author name";
              };
              email = lib.mkOption {
                type = lib.types.str;
                default = "${config.var.username}@users.noreply.github.com";
                description = "Git commit author email";
              };
            };
          };
          default = {};
          description = "Git user configuration";
        };
        storageDirectory = lib.mkOption {
          type = lib.types.str;
          default = "/data";
          description = "Base storage path for persistent server media and service data";
        };
      };
    };
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
    ./hardware/boot/windows.nix
    ./hardware/cpu/amd.nix
    ./hardware/cpu/intel.nix
    ./hardware/gpu/amd.nix
    ./hardware/gpu/nvidia.nix
    ../themes/nox.nix
  ];
}

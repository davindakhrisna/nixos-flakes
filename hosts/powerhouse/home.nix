{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    inputs.nvf-config.homeManagerModules.default

    # Desktop Environment (Hyprland, Waybar, Dunst, Tofi, Hyprlock, Mime, etc.)
    ../../modules/home/de/defaults.nix

    # GUI Applications (Helium, Proton, Thorium, etc.)
    ../../modules/home/gui/defaults.nix

    # TUI Suite (Elio, Ghostty, Git, NVF, Shell, Dev, etc.)
    ../../modules/home/tui/defaults.nix

    # Stylix Theme
    ../../themes/nox.nix
  ];

  home = {
    username = osConfig.var.username;
    homeDirectory = "/home/" + osConfig.var.username;
    stateVersion = "26.05";
  };

  wayland.windowManager.hyprland.settings.monitor = [
    ",highres,auto,1"
  ];

  programs.home-manager.enable = true;
}

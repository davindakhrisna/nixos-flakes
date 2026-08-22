{
  inputs,
  osConfig,
  ...
}: {
  imports = [
    inputs.nvf-config.homeManagerModules.default

    # Desktop Environment (Hyprland, Waybar, Dunst, Tofi, Hyprlock, Mime, etc.)
    ../../modules/home/desktop/defaults.nix

    # GUI Applications (Helium, Proton, Thorium, etc.)
    ../../modules/home/gui/defaults.nix

    # TUI Suite (Elio, Ghostty, Git, NVF, Shell, etc.)
    ../../modules/home/tui/defaults.nix

    # Development (Go, Node, Python, DSH, Pi, IDEs, etc.)
    ../../modules/home/dev/defaults.nix

    # Stylix Theme
    ../../themes/nox.nix
  ];

  home = {
    username = osConfig.var.username;
    homeDirectory = "/home/" + osConfig.var.username;
    stateVersion = "26.05";
  };

  # Portable (A275 laptop) monitor settings
  wayland.windowManager.hyprland.settings.monitor = [
    ",preferred,auto,1"
  ];

  programs.home-manager.enable = true;
}

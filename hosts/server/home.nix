# Server User Configuration (Headless)
{
  osConfig,
  ...
}: {
  imports = [
    # TUI Suite (Zsh, Starship, NVF, Git, Elio, FZF, etc.)
    ../../modules/home/tui/defaults.nix

    # Stylix theming
    ../../themes/nox.nix
  ];

  home = {
    username = osConfig.var.username;
    homeDirectory = "/home/" + osConfig.var.username;
    stateVersion = "26.05";
  };

  programs.home-manager.enable = true;
}

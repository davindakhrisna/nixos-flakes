{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  imports = [
    ./elio
    ./ghostty
    ./git
    ./ilovetui
    ./navi
    ./nix-utils
    ./nixy
    ./nvf
    ./shell
    ./dev
  ];

    home.packages = with pkgs; [
    gparted
    pom # Pomodoro timer in your terminal
    jless # A pager for JSON
    spotatui # Spotify TUI
    pkgs.nur.repos.anotherhadi.settuings # Terminal based settings (wifi, bluetooth, audio, ...)
    pkgs.nur.repos.anotherhadi.monitui # Edit hyprland's monitor configuration
    imagemagick # Image manipulation tool
    gh # GitHub

    # Just cool
    pipes
    cmatrix
    fastfetch
  ];
}

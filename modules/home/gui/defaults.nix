{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
    imports = [
    ./helium
    ./proton
    ./thorium
  ];

  home.packages = with pkgs; [
    vlc # Video player
    obsidian # Note taking app
    pinta # Image editor
    onlyoffice-desktopeditors # Office suite
    blanket # Listen to different sounds
    spotify # Music
    vesktop # Discord
    ticktick # Todo app
    winboat # Windows
    xournalpp # Draw / Annotate PDFs
    dbgate # SQL Management
    inputs.antigravity.packages.${pkgs.stdenv.hostPlatform.system}.default # Antigravity IDE

    # Backup
    thunar
    gnome-text-editor
  ];
}

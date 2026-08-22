{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
    imports = [
    ./helium
    ./thorium
  ];

  home.packages = with pkgs; [
    # Media
    vlc # Video player
    pinta # Image editor
    blanket # Listen to different sounds
    spotify # Music
    vesktop # Discord

    # Productivity
    obsidian # Note taking app
    onlyoffice-desktopeditors # Office suite
    winboat # Windows
    keepassxc # Password manager
    
    # Backup
    thunar
    gnome-text-editor
  ];
}

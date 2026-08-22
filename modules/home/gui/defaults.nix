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
    ./keepassxc
  ];

  home.packages = with pkgs; [
    vlc # Video player
    obsidian # Note taking app
    pinta # Image editor
    onlyoffice-desktopeditors # Office suite
    blanket # Listen to different sounds
    spotify # Music
    vesktop # Discord
    winboat # Windows
    
    # Backup
    thunar
    gnome-text-editor
  ];
}

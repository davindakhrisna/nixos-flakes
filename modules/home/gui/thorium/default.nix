# Thorium Reader - EPUB & Document Reader
{
  pkgs,
  lib,
  ...
}: let
  version = "3.4.0";
  pname = "thorium-reader";

  src = pkgs.fetchurl {
    url = "https://github.com/edrlab/thorium-reader/releases/download/v${version}/Thorium-${version}.AppImage";
    hash = "sha256-wMdfEwgRj/ggTvwhYt+B93LrkeD4bmBliWY12V10qaA=";
  };

  appimageContents = pkgs.appimageTools.extractType2 {
    inherit pname version src;
  };

  thorium = pkgs.appimageTools.wrapType2 {
    inherit pname version src;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/thorium.desktop $out/share/applications/thorium.desktop 2>/dev/null || true
      install -m 444 -D ${appimageContents}/thorium.png $out/share/icons/hicolor/512x512/apps/thorium.png 2>/dev/null || true
    '';
  };
in {
  home.packages = [thorium];

  xdg.desktopEntries.thorium = {
    name = "Thorium Reader";
    comment = "Cross-platform EPUB Reader";
    exec = "${thorium}/bin/thorium-reader %U";
    terminal = false;
    icon = "thorium";
    categories = ["Office" "Viewer"];
    mimeType = [
      "application/epub+zip"
      "application/pdf"
      "application/audiobook+lcp"
    ];
  };
}

{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  ...
}: {
  home = {
    packages = with pkgs-unstable;
      [
        go
      ]
      ++ (with pkgs; [
        nodejs
        pnpm
        python3
        nix-prefetch-github
      ]);

    sessionPath = ["$HOME/.local/share/go/bin"];
    sessionVariables.GOPATH = "$HOME/.local/share/go";
  };
}
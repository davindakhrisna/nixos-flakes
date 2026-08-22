{
  pkgs,
  pkgs-unstable,
  config,
  lib,
  inputs,
  ...
}: let
  # DeepSeek Harness runner
  dsh = pkgs.writeShellScriptBin "dsh" ''
    exec ${pkgs.nodejs}/bin/npx -y @deepseek-ai/dsh "$@"
  '';

  # Pi Coding Agent runner
  pi = pkgs.writeShellScriptBin "pi" ''
    exec ${pkgs.nodejs}/bin/npx -y @earendil-works/pi-coding-agent "$@"
  '';
in {
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

        # AI Agent Harnesses
        dsh
        pi

        # GUI Dev Tools
        zed-editor # Zeditor
        dbgate # SQL Management
        inputs.antigravity.packages.${pkgs.stdenv.hostPlatform.system}.default # Antigravity IDE
      ]);

    sessionPath = ["$HOME/.local/share/go/bin"];
    sessionVariables.GOPATH = "$HOME/.local/share/go";
  };
}
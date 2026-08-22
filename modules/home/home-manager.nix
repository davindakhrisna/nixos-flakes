# Home-manager configuration for NixOS
{
  inputs,
  pkgs-unstable,
  ...
}: {
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "hm-backup";
    sharedModules = [
      inputs.stylix.homeModules.stylix
    ];
    extraSpecialArgs = {
      inherit inputs pkgs-unstable;
    };
  };
}

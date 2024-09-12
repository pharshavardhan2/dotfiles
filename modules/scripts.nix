{ pkgs, ... }:
{
  home.packages = [
    (import ../scripts/brightness.nix { inherit pkgs; })
  ];
}

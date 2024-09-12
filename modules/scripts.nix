{ pkgs, ... }:
{
  home.packages = [
    (import ../scripts/brightness.nix { inherit pkgs; })
    (import ../scripts/battery.nix { inherit pkgs; })
    (import ../scripts/powermenu.nix { inherit pkgs; })
    (import ../scripts/emoji.nix { inherit pkgs; })
  ];
}

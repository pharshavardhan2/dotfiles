{ pkgs, inputs, username, host, ... }:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  imports = [
    ../../modules/desktops/hyprland/hyprland.nix
    ../../modules/git.nix
    ../../modules/hyprlock.nix
    ../../modules/hypridle.nix
    ../../modules/scripts.nix
    ../../modules/waybar.nix
    ../../modules/wezterm.nix
  ];
  
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  stylix.targets = {
    waybar.enable = false;
    hyprland.enable = false;
  };
  
  programs = {
    home-manager.enable = true;
    helix.enable = true;
  };
}

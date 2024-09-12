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
    wezterm = {
      enable = true;
      package = inputs.wezterm.packages.x86_64-linux.default;
      extraConfig = ''
        local wezterm = require 'wezterm'
        local config = {}
        config.color_scheme = 'Tokyo Night (Gogh)'
        return config
     '';
    };
    helix.enable = true;
  };
}

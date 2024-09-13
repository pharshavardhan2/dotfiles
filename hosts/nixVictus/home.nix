{ pkgs, inputs, username, host, ... }:
{
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";
  home.stateVersion = "24.05";

  imports = [
    ../../home_manager
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
    tofi.enable = false;
  };
  
  programs = {
    home-manager.enable = true;
    helix.enable = true;
  };
}

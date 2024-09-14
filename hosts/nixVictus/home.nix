{ pkgs, inputs, username, host, ... }:
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = [
      pkgs.zed-editor
    ];
  };

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
  };
}

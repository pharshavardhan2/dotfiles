{ pkgs, inputs, username, host, ... }:
{
  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "24.05";
    packages = with pkgs; [
      zed-editor
      # lsp
      pylyzer
      basedpyright
      ruff
      nil
      nixpkgs-fmt
    ];
  };

  imports = [
    ../../home_manager
  ];

  # zed config files
  home.file.".config/zed" = {
    source = ../../config/zed;
    recursive = true;
  };

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

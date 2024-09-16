{ pkgs, inputs, ... }:
{
  programs = {
    zsh.enable = true;
    fish.enable = true;
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
    firefox.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    git
    curl
    vim
    eza
    wl-clipboard
    ripgrep
    brightnessctl
    pavucontrol
    bat
    kanshi
    nautilus
  ];
}

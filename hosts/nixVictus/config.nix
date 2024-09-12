# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, host, username, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../../modules/programs.nix
      ../../modules/services.nix
      inputs.nixos-cosmic.nixosModules.default
    ];

  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxPackages_zen; 
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
  
  # fonts
  fonts = {
    packages = with pkgs; [
      noto-fonts
    ];
  };
  
  # stylix 
  stylix = {
    enable = true;
    image = ../../walls/beautifulmountainscape.jpg;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
  };
  # bluetooth
  hardware.bluetooth.enable = true;
  
  # security
  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };
  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = host;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.harsha = {
    isNormalUser = true;
    description = "harsha";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  # nixpkgs.config.allowUnfree = true;

  # Enable flakes and nix-command
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes"];
      auto-optimise-store = true;
      substituters = [ 
        "https://hyprland.cachix.org" 
        "https://cosmic.cachix.org/"
      ];
      trusted-public-keys = [ 
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}

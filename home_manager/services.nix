{
  services = {
    libinput.enable = true;
    gvfs.enable = true;
    openssh.enable = true;
    printing.enable = true;
    gnome.gnome-keyring.enable = true;
    # audio
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # bluetooth
    blueman.enable = true;
    # cosmic
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;

    # qtile
    xserver.windowManager.qtile = {
      enable = true;
      configFile = ./desktops/qtile/config.py;
    };

    # xkb
    xserver.xkb.layout = "us";

    # amd
    xserver.videoDrivers = [ "amdgpu" ];
  };
}

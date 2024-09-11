{
  services = {
    gvfs.enable = true;
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    # cosmic
    desktopManager.cosmic.enable = true;
    displayManager.cosmic-greeter.enable = true;

    # qtile
    xserver.windowManager.qtile = {
      enable = true;
      configFile = ../desktops/qtile/config.py;
    };
  };
}

{
  imports = [
    ../desktops/cosmic/cosmic.nix
    ../desktops/qtile/qtile.nix
  ];
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

    # xkb
    xserver.xkb.layout = "us";

    # amd
    xserver.videoDrivers = [ "amdgpu" ];
  };
}

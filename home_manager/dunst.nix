{ lib, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        monitor = 0;
        follow = "mouse";
        origin = "top-right";
        progress_bar = true;
        padding = 15;
        horizontal_padding = 15;
        font = lib.mkDefault "JetBrainsMono Nerd Font";
        transparency = 10;
      };
      urgency_normal = {
        timeout = 5;
      };
      urgency_low = {
        timeout = 5;
      };
      urgency_critical = {
        timeout = 100;
      };
    };
  };
}

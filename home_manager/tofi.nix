{ lib, config, ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      text-color = config.lib.stylix.colors.base0D;
      prompt-color = config.lib.stylix.colors.base0F;
      selection-color = config.lib.stylix.colors.base0F;
      background-color = "#000A"; 
      prompt-text = "> ";
      border-width = 0;
      outline-width = 0;
      font-size = 24;
      font = "JetBrainsMono Nerd Font Mono";
      width = "100%";
      height = "100%";
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 8;
    };
  };
}

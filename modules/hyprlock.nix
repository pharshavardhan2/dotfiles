{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        hide_cursor = true;
        grace = 10;
      };
      background = [
        {
          color = "rgba(000000FF)";
          blur_size = 5;
          blur_passes = 4;
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "250, 50";
          outline_thickness = 2;
          dots_size = 0.1;
          dots_spacing = 0.3;
          outer_color = "rgba(3B3B3B55)";
          inner_color = "rgba(33333311)";
          font_color = "rgba(FFFFFFFF)";
          position = "0, 20";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        # clock
        {
          monitor = "";
          text = "$TIME";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(FFFFFFFF)";
          font_size = 65;
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # greeting
        {
          monitor = "";
          text = "Hi, $USER !!";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(FFFFFFFF)";
          font_size = 20;
          position = "0, 240";
          halign = "center";
          valign = "center";
        }
        # battery
        {          
          monitor = "";
          text = "cmd[update:5000] ~/.local/share/bin/battery.sh";
          shadow_passes = 1;
          shadow_boost = 0.5;
          color = "rgba(FFFFFFFF)";
          font_size = 14;
          position = "30, -30";
          halign = "left";
          valign = "top";
        }
      ];
    };
  };
}

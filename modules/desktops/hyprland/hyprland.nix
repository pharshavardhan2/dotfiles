{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    settings = {
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      "$mod" = "SUPER";
      "$terminal" = "wezterm";
      "$browser" = "firefox";
      "$fileManager" = "thunar";
      general = {
        gaps_in = 0;
        gaps_out = 0;
        "col.active_border" = "0x77777777";
        resize_on_border = true;
        layout = "dwindle";
      };
      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          tap-and-drag = true;
        };
      };
      cursor = {
        inactive_timeout = 10;
      };
      monitor = [
        "eDP-1, 1920x1080, 1920x0, 1"
        "HDMI-A-1, 1920x1080, 0x0, 1"
      ];
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      exec-once = [
        "hypridle"
      ];
      bind = [
        "$mod, B, exec, $browser"
        "$mod, Return, exec, $terminal"
        "$mod, F, exec, $fileManager"
        "ALT, F4, killactive"
        "$mod, M, exit"
        "ALT, TAB, cyclenext"
        "ALT, TAB, bringactivetotop"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..10} to [move to] workspace {1..10}
        builtins.concatLists (builtins.genList (
          x: let
            ws = let
              c = (x + 1) / 10;
            in
              builtins.toString (x + 1 - (c * 10));
          in [
            "$mod, ${ws}, workspace, ${toString (x + 1)}"
            "$mod SHIFT, ${ws}, movetoworkspace, ${toString (x + 1)}"
          ]
        )
        10)
      );

      bindl = [
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ];
      bindel = [
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ];
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
    };
  };
}

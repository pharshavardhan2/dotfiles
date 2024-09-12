{ inputs, ... }:
{
  programs.wezterm = {
  	enable = true;
  	package = inputs.wezterm.packages.x86_64-linux.default;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local act = wezterm.action
      local config = {}
      config.color_scheme = 'Tokyo Night (Gogh)'
      config.hide_tab_bar_if_only_one_tab = true

      config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 2000 }
      config.keys = {
        {
          mods = 'LEADER',
          key = '-',
          action = act.SplitVertical { domain = 'CurrentPaneDomain' }
        },
        {
          mods = 'LEADER',
          key = '=',
          action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }
        },
        {
          mods = 'LEADER',
          key = 'Space',
          action = act.RotatePanes 'Clockwise'
        },
        {
          mods = 'LEADER',
          key = '0',
          action = act.PaneSelect {
            mode = 'SwapWithActive'
          }
        },
        {
          mods = 'LEADER',
          key = 'h',
          action = act.ActivatePaneDirection 'Left'
        },
        {
          mods = 'LEADER',
          key = 'l',
          action = act.ActivatePaneDirection 'Right'
        },
        {
          mods = 'LEADER',
          key = 'j',
          action = act.ActivatePaneDirection 'Down'
        },
        {
          mods = 'LEADER',
          key = 'k',
          action = act.ActivatePaneDirection 'Up'
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'LeftArrow',
          action = act.AdjustPaneSize { 'Left', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'RightArrow',
          action = act.AdjustPaneSize { 'Right', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'DownArrow',
          action = act.AdjustPaneSize { 'Down', 5 }
        },
        {
          mods = 'CTRL|SHIFT',
          key = 'UpArrow',
          action = act.AdjustPaneSize { 'Up', 5 }
        },
      }
      return config
    '';
  };
}

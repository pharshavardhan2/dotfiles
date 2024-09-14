{ pkgs }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      ruff
      pyright
    ]
    settings = {
      editor = {
        line-number = "relative";
        true-color = true;
        statusline = {
          right = [
            "diagnostics"
            "selections"
            "register"
            "position"
            "total-line-numbers"
            "file-encoding"
          ];
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        whitespace = {
          render = "all";
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
      };
    };
    languages = {
      language = [
        {
          name = "python";
          language-servers = [ "pyright" "ruff" ];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          auto-format = true;
        }
      ];
      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        }
      }
    };
  };
}

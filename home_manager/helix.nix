{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      ruff
      pyright
      nil
      nixpkgs-fmt
    ];
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
          render = {
            tab = "all";
            nbsp = "all";
            nnbsp = "all";
            # newline = "all";
          };
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
        {
          name = "nix";
          formatter = {
            command = "nixpkgs-fmt";
          };
          auto-format = true;
        }
      ];
      language-server = {
        ruff = {
          command = "ruff";
          args = [ "server" ];
        };
      };
    };
  };
}

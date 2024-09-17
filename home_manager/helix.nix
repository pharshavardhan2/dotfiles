{
  programs.helix = {
    enable = true;
    defaultEditor = true;
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
          language-servers = [ "pylyzer" "ruff" ];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          auto-format = true;
          formatter = {
            command = "ruff";
            args = [ "format" "-" ];
          };
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
        pylyzer = {
          command = "pylyzer";
          args = [ "--server" ];
        };
      };
    };
  };
}

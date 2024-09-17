{ pkgs, ... }:
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
          # scope = "source.python";
          # injection-regex = "python";
          # file-types = [ "py" ];
          # shebangs = [ "python" ];
          # roots = [ "pyproject.toml" "setup.py" "Poetry.lock" "manage.py" ];
          # comment-token = "#";
          language-servers = [ "pyright" "ruff" ];
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
        # pyright = {
        #   command = "pyright-langserver";
        #   args = [ "--stdio" ];
        # };
      };
    };
  };
}

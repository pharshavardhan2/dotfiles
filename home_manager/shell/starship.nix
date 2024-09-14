{
  programs.starship = {
    enable = true;
    settings = {
      python.symbol = "[](blue) ";
      lua.symbol = "[](blue) ";
      nix_shell = {
        heuristic = true;
      };
    };
  };
}

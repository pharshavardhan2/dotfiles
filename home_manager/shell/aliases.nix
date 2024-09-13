{
  home.shellAliases = {
    md = "mkdir -p";
    # eza
    l  = "eza -lh  --icons=auto";                                       # long list
    ls = "eza -1   --icons=auto";                                       # short list
    ll = "eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
    ld = "eza -lhD --icons=auto";                                       # long list dirs
    lt = "eza --icons=auto --tree";                                     # list folder as tree
  };
}

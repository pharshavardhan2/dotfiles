{ pkgs, config, ... }:
{
  programs.zsh = {
    enable = true;
    dotDir = "dotfiles/home_manager/shell";
    autocd = true;
    dirHashes = {
      docs  = "$HOME/Documents";
      vids  = "$HOME/Videos";
      dl    = "$HOME/Downloads";
      pics  = "$HOME/Pictures";
    };
    autosuggestion.enable = true;
    history = {
      path = "${config.xdg.dataHome}/zsh/zsh_history";
    };
    initExtra = ''
      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true

      # use cache for completions
      zstyle ':completion:*' use-cache on
      zstyle ':completion:*' cache-path "${config.xdg.cacheHome}/zsh/.zcompcache"
      _comp_options+=(globdots)
    '';
  };
}

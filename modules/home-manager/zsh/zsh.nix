{ config, pkgs, ... }:{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      cl = "clear";
    };

    initContent = ''
      bindkey -v
      PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '
    '';
  };
}

{ config, pkgs, ... }:

let
  c = config.theme.colors;
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    plugins = [ pkgs.zsh-autosuggestions pkgs.zsh-syntax-highlighting ];

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      cl = "clear";
      rebuild = "sudo nixos-rebuild switch --flake .#$(hostname)";
    };

    initContent = ''
      bindkey -v
      PROMPT='%F{${c.cyan}}%n@%m%f %F{${c.yellow}}%~%f %# '
    '';
  };
}

{ config, pkgs, ... }:

let
  c = config.theme.colors;
in
{
  programs.zsh = {
    enable = true;

    shellAliases = {
      ll = "ls -lah";
      gs = "git status";
      rebuild = "sudo nixos-rebuild switch --flake .#$(hostname)";
    };

    initContent = ''
      bindkey -v
      PROMPT='%F{${c.cyan}}%n@%m%f %F{${c.yellow}}%~%f %# '
    '';
  };
}

{ config, pkgs, ... }:

let
  c = config.theme.colors;
in
{
  programs.zsh = {
    enable = true;

    initExtra = ''
      bindkey -v
      PROMPT='%F{${c.cyan}}%n@%m%f %F{${c.yellow}}%~%f %# '
    '';
  };
}

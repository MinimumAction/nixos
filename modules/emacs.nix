{ pkgs, ... }:{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; # For wayland support
  };

}
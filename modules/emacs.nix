{ pkgs, ... }:{

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; # For wayland support
  };

}
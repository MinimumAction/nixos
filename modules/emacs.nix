{ pkgs, ... }:{

  services.emacs = {
    enable = true;
    package = pkgs.emacs-pgtk; # Use the gtk for wayland support
  };

}
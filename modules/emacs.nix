{ pkgs, ... }:{
  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk; # emacs-gtk for wayland support
  };
}
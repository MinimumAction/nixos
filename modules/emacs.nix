{ pkgs, ... }:{
  services.emacs = {
    enable = true;
    package = pkgs.emacs; # emacs-gtk for wayland support
  };
}
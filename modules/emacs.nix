{ pkgs, ... }:{

  programs.emacs = {
    enable = true;
    package = pkgs.emacs-gtk; # Use the gtk for wayland support
    extraPackages = epkgs: with epkgs; [
      use-package
      magit
    ];
  };

  systemd.user.services.emacs.enable = true;

}
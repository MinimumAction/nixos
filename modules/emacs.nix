{ pkgs, ... }:{
  services.emacs = {
    enable = true;
    package = pkgs.emacs-gtk; # emacs-gtk for wayland support
    extraPackages = epkgs: [ 
      epkgs.use-package 
      epkgs.magit 
    ];
  };
}
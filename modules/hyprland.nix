# hyprland.nix

{ pkgs, ... }: {

  # Disable XServer
  services.xserver.enable = false;

  # Enable hyprland
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = false;
  };
  
  # Enable UWSM
  programs.uwsm.enable = true;

  # Disable waybar so hyprland can start it
  programs.waybar.enable = false;

  # Thunar
  programs.thunar.enable = true;

  # Portal?
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  # Packages and programs needed for use with hyprland
  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprlock
    hyprpaper
    gtk3
    libnotify
    mako
    networkmanagerapplet
    pavucontrol
    waybar
    wlogout
    wofi
  ];
  
  # Fix electron apps in Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  # To be able to log back in from lock screen
  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };

}
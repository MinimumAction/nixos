{ pkgs, ... }:{

  systemd.user.services.emacs = {
  description = "Emacs daemon (PGTK)";
  after = [ "graphical-session.target" ];
  partOf = [ "graphical-session.target" ];

  serviceConfig = {
    ExecStart = "${pkgs.emacs-pgtk}/bin/emacs --fg-daemon";
    Restart = "on-failure";
    Environment = "WAYLAND_DISPLAY=wayland-0";
  };
};


}
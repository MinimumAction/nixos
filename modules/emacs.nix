{ pkgs, ... }:{

  systemd.user.services.emacs = {
    Unit = {
      Description = "Emacs daemon (PGTK)";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.emacs-pgtk}/bin/emacs --fg-daemon";
      Restart = "on-failure";
      Environment = "WAYLAND_DISPLAY=wayland-0";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };

}
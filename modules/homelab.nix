{ pkgs, ... }:{
  # Enable Syncthing
  services.syncthing.enable = true;

  # Enable Caddy
  services.caddy = {
    enable = true;
    virtualHosts."lestrade.syncthing" = {
      extraConfig = ''
        reverse_proxy 127.0.0.1:8384
      '';
    };
  };
}
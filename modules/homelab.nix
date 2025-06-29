{ pkgs, ... }:{
  # Enable Syncthing
  services.syncthing.enable = true;

  # Set up DNSMASQ
  services.dnsmasq = {
    enable = true;
    settings = {
      listen-address = [
        "127.0.0.1" 
        "100.78.210.41" 
      ];
      address = [
        "/lestrade.syncthing/100.78.210.41"  # NixOS server’s Tailscale IP
      ];
    };
  };

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
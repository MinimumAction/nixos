{ pkgs, ... }: {

  services.blueman.enable = true;     # enable  blueman
  services.tailscale.enable = true;   # enable  tailscale
  services.pulseaudio.enable = false; # disable pulseaudio
  services.pipewire = {               # enable  pipewire  
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

}
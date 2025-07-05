{ pkgs, lib, config, hostname, ... }:{
  
  # User definition
  users.users.kevin = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$PtbhYydbhh.z0qInjgrQS1$0oLkk3FlJztVtmVJqpWQWCDs8kdX2zzMkJKQkkzAtu9";
    # hashedPasswordFile = "/persist/secrets/kevin-passwd.hash";
    shell = pkgs.zsh;
    description = "Kevin Liguori";
    extraGroups = [ 
      "wheel" 
      "networkmanager" 
      "libvirtd" 
      "kvm" 
    ];
  };

  # Home-Manager imports and settings add logic to include different things for different hosts
  home-manager.users.kevin = {
    home = {
      username = "kevin";
      homeDirectory = "/home/kevin";
      stateVersion = "25.05";
    };

    # Programs
    imports = [
      
      # included for all hosts
      ../modules/themes/dracula.nix                  # Dracula theme
      ../modules/fonts/nerd-font.nix                 # JetbrainsMono Nerd Font
      ../modules/home-manager/waybar/waybar.nix      # Waybar theme
      ../modules/home-manager/wofi/wofi.nix          # Wofi theme
      ../modules/home-manager/git/git.nix            # Git config
      ../modules/home-manager/zsh/zsh.nix            # Zsh config
      ../modules/home-manager/starship/starship.nix  # Starship config

    ] ++ lib.optionals (hostname == "watson") [
      # only included for lestrade
    ] ++ lib.optionals (hostname == "lestrade") [
      # only included for lestrade
    ];

    # Packages
    home.packages = with pkgs; [];
  };

}

{ pkgs, lib, config, hostname, ... }:{
  
  # User definition
  users.users.kevin = {
    isNormalUser = true;
    hashedPassword = "$y$j9T$PtbhYydbhh.z0qInjgrQS1$0oLkk3FlJztVtmVJqpWQWCDs8kdX2zzMkJKQkkzAtu9";
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
    home.username = "kevin";
    home.homeDirectory = "/home/kevin";
    home.stateVersion = "25.05";

    # Programs (maybe import in the future)
    imports = [
      # included for all hosts
      ../modules/home-manager/zsh/zsh.nix
      ../modules/home-manager/starship/starship.nix
    ] ++ lib.optionals (hostname == "watson") [
    ] ++ lib.optionals (hostname == "lestrade") [
        # only included for lestrade
    ];

    # Packages
    home.packages = with pkgs; [];
  };

}
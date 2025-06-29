{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [   
    # Basic shell utilities
    pciutils
    tree
    unzip

    # Editors
    neovim
    vim

    # Networking
    curl
    dig
    host
    iproute2
    iputils
    nettools
    nmap
    traceroute
    wget

    # Monitoring
    htop
    fastfetch 

    # Storage
    btrfs-progs
    rsync

    # Version control
    git
    stow
  ];

}
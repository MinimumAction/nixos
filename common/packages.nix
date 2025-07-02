{ pkgs, ... }: {

  environment.systemPackages = with pkgs; [   
    # Basic shell utilities
    pciutils
    tree
    unzip

    # Editors
    vim
    emacs-pgtk

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
    zfs
    btrfs-progs
    rsync

    # Version control
    git
    stow
  ];

}
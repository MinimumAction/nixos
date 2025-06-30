{ pkgs, ... }: {

  # Packages
  environment.systemPackages = with pkgs; [
    brave
    ghostty
    kitty
    mpv
    spotify
    tokyonight-gtk-theme
    virt-manager
    vscode
  ];

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

}
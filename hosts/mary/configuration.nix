# nixos-config/hosts/mary/configuration.nix
# This module contains the config for a live iso

{ config, lib, pkgs, modulesPath, ... }:{

  # Imports
  imports =[ 
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix" # minimal NixOS install
    ./../../common/default.nix                                    # default settings, programs, packages and services
  ];

  # Boot parameters to support zfs & include drivers for external wifi adapter 
  boot = {
    supportedFilesystems = [ "zfs" ];
    extraModulePackages = with config.boot.kernelPackages; [ rtl8812au ];
    initrd.kernelModules = [ "8812au" ];
  };

  # Networking
  networking.hostName = "nixos-live";
  networking.wireless.enable = false; # turn off wpa_supplicant
  networking.networkmanager.enable = true; # turn on network manager

  # Default user
  users.users.nixos = {
    isNormalUser = true;
    password = "nixos";
    extraGroups = [ "wheel" ];
  };

  # Live usb specific system packages
  environment.systemPackages = with pkgs; [];

}
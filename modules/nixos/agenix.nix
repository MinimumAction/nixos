{ config, lib, pkgs, ... }:

let
  persistPath = "/persist/agenix";
  etcPath = "/etc/agenix";
in 
{
  options = {};

  config = {
    programs.agenix.enable = true;
    systemd.tmpfiles.rules = [
      "d ${etcPath} 0755 root root -"                        # Ensure /etc/agenix exists
      "L+ ${etcPath}/key.txt - - - - ${persistPath}/key.txt" # Symlink key from persistent location
    ];
  };
}

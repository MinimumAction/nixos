{ config, pkgs, ... }:{

  environment.systemPackages = [
    (pkgs.neovim.override {
      configure = {
        packages.myPlugins = with pkgs.vimPlugins; {
          start = [
            # lualine-nvim
            telescope-nvim
            # plenary-nvim
            # nvim-treesitter
            # nvim-lspconfig
            # vim-nix
          ];
        };
      };
    })
  ];
}

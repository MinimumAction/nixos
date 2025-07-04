# modules/home-manager/wofi.nix
{ config, lib, pkgs, ... }:

let
  c = config.theme.colors;
in
{
  programs.wofi.enable = true;

  /*
    You can add options like
      programs.wofi.settings = { ... };
    if you want to manage ~/.config/wofi/config as well.
  */

  #####################################################################
  # Write Dracula-flavoured style.css
  #####################################################################
  xdg.configFile."wofi/style.css".text = ''
    /* ---------- Dracula colour tokens ---------- */
    @define-color base        ${c.background};
    @define-color text        ${c.foreground};
    @define-color lavender    ${c.purple};   /* used for border + arrow */
    @define-color mauve       ${c.pink};     /* highlight text */
    @define-color red         ${c.red};      /* input outline */

    /* ---------- General ----------- */
    * {
      font-family: 'CaskaydiaCove Nerd Font', monospace;
      font-size: 18px;
    }

    /* ---------- Window ----------- */
    window {
      margin: 0px;
      padding: 10px;
      border: 2px solid @lavender;
      border-radius: 8px;
      background-color: @base;
    }

    /* ---------- Boxes / Scroll ----------- */
    #inner-box, #outer-box, #scroll {
      margin: 5px;
      padding: 10px;
      border: none;
      background-color: @base;
    }

    /* ---------- Input ----------- */
    #input {
      margin: 5px 20px;
      padding: 10px;
      border: none;
      border-radius: 0.1em;
      color: @text;
      background-color: @base;
    }
    #input image         { border: none; color: @red; }
    #input *             { outline: 4px solid @red !important; }

    /* ---------- List entries ----------- */
    #text                { margin: 5px; border: none; color: @text; }
    #entry               { background-color: @base; }
    #entry arrow         { border: none; color: @lavender; }

    #entry:selected      { border: 0.11em solid @lavender; }
    #entry:selected #text{ color: @mauve; }
    #entry:drop(active)  { background-color: @lavender !important; }
  '';
}

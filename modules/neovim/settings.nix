# modules/neovim/settings.nix
{
  pkgs,
  ...
}:
{
  programs.nixvim =
    let
      inherit (pkgs.stdenv.hostPlatform) isDarwin isLinux;
    in
    {
      autoCmd = [
        {
          command = "lua require('otter').activate({'bash'}, true, true, nil)";
          event = [ "FileType" ];
          pattern = [ "nix" ];
        }
      ];

      clipboard = {
        providers = {
          pbcopy.enable = isDarwin;
          wl-copy.enable = isLinux;
        };

        register = "unnamedplus";
      };

      defaultEditor = true;
      enablePrintInit = true;
      globals.mapleader = "\\";
      nixpkgs.useGlobalPackages = true;

      opts = {
        autocomplete = true;
        expandtab = true;

        fillchars = {
          eob = " ";
          fold = " ";
          foldclose = "";
          foldinner = " ";
          foldopen = "";
          foldsep = " ";
        };

        foldcolumn = "1";
        foldenable = true;
        foldexpr = "v:lua.vim.treesitter.foldexpr()";
        foldlevel = 99;
        foldlevelstart = 99;
        foldmethod = "expr";
        number = true;
        numberwidth = 4;
        shiftwidth = 2;
        signcolumn = "yes:1";
        softtabstop = 2;
        statuscolumn = "%s%C %=%l ";
        tabstop = 2;
      };

      waylandSupport = isLinux;
    };
}

# modules/neovim/default.nix
{
  lib,
  pkgs,
  ...
}:
{
  imports = [
    ./app.nix
    ./colors.nix
    ./keybinds.nix
    ./pedantix.nix
    ./plugins/coding.nix
    ./plugins/lualine.nix
    ./settings.nix
  ];

  home = with pkgs; {
    packages = [ page ];

    sessionVariables = {
      EDITOR = lib.mkForce "nvim";
      PAGER = lib.getExe page;
    };
  };

  programs.nixvim = {
    enable = true;
  }
  // {
    viAlias = true;
    vimAlias = true;
  }
  # don't write into ~/.config
  // {
    impureRtp = false;
    wrapRc = true;
  };
}

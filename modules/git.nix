# modules/git.nix
{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    git = {
      enable = true;

      settings = {
        commit.gpgsign = true;
        core.pager = lib.getExe pkgs.page;
        init.defaultBranch = "main";

        user = {
          email = config.kovaterm.email;
          name = config.kovaterm.name;
        };
      };
    };

    lazygit.enable = true;
  };
}

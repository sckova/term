# modules/git.nix
{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs = {
    gh = {
      enable = true;

      hosts."github.com" = {
        git_protocol = "https";
        user = config.home.username;
        users.${config.home.username} = ""; # dunno, this was how it generated
      };

      settings = {
        accessible_colors = "disabled";
        accessible_prompter = "disabled";
        aliases.co = "pr checkout";
        browser = lib.getExe pkgs.firefox;
        color_labels = "enabled";
        editor = lib.getExe pkgs.neovim;
        git_protocol = "https";
        pager = lib.getExe pkgs.page;
        prefer_editor_prompt = "disabled";
        prompt = "enabled";
        spinner = "enabled";
        version = 1;
      };
    };

    git = {
      enable = true;

      settings = {
        commit.gpgsign = true;
        core.pager = lib.getExe pkgs.page;
        diff.external = lib.getExe pkgs.difftastic;
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

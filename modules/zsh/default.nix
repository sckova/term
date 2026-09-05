# modules/zsh/default.nix
{
  lib,
  ...
}:
{
  imports = [
    ./aliases.nix
    ./binds.nix
    ./prompt.nix
    ./scripts.nix
    ./settings.nix
    ./syntax-highlighting.nix
  ];

  options.zshrc = lib.mkOption {
    default = { };
    description = "concatenated zsh initContent";
    internal = true;
    type = lib.types.attrsOf lib.types.lines;
  };

  config = {
    home.shell.enableZshIntegration = true;
    programs.zsh.enable = true;
  };
}

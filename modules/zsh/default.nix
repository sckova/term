# modules/zsh/default.nix
{
  imports = [
    ./aliases.nix
    ./binds.nix
    ./prompt.nix
    ./scripts.nix
    ./settings.nix
    ./syntax-highlighting.nix
  ];

  home.shell.enableZshIntegration = true;
  programs.zsh.enable = true;
}

# modules/default.nix
{
  imports = [
    ./btop.nix
    ./fastfetch.nix
    ./git.nix
    ./neovim
    ./ssh.nix
    ./zsh
  ];
}

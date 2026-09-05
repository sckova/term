# modules/default.nix
{
  imports = [
    ./btop.nix
    ./fastfetch.nix
    ./git.nix
    ./misc.nix
    ./neovim
    ./ssh.nix
    ./zsh
  ];
}

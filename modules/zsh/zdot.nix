# modules/zsh/zdot.nix
{
  config,
  lib,
  pkgs,
  hostname,
  ...
}:
let
  f = config.home.file;
  file = pkgs.runCommand "zdotdir-${hostname}" { } ''
    mkdir -p $out
    cp ${pkgs.writeText ".zshenv" f.".config/zsh/.zshenv".text} $out/.zshenv
    sed -i '/^export ZDOTDIR=/d; /^ZDOTDIR=/d' $out/.zshenv
    cp ${pkgs.writeText ".zprofile" f.".config/zsh/.zprofile".text} $out/.zprofile
    cp ${pkgs.writeText ".zshrc" f.".config/zsh/.zshrc".text} $out/.zshrc
  '';
in
{
  home.file = {
    ".config/zsh/.zprofile".enable = lib.mkForce false;
    ".config/zsh/.zshenv".enable = lib.mkForce false;
    ".config/zsh/.zshrc".enable = lib.mkForce false;

    ".zshenv".text = lib.mkForce ''
      export ZDOTDIR="${file}"
      source "${file}/.zshenv"
    '';
  };
}

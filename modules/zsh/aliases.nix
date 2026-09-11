# modules/zsh/aliases.nix
{ lib, ... }:
{
  config.zshrc.aliases = lib.concatStringsSep "\n" (
    lib.mapAttrsToList (name: value: "alias -- ${name}='${value}'") {
      ":q" = "exit";
      cat = "bat";
      eza = "eza --icons auto --color always --git";
      ga = "git add -v .";
      gac = "git add -v . && git commit";
      gaca = "git add -v . && git commit --amend --no-edit";
      gd = "git diff";
      gdt = "git -c diff.external=difft diff --ext-diff";
      gl = "git log";
      gp = "git push";
      gpf = "git push --force";
      gzip = "pigz";
      la = "eza -a";
      ll = "eza -l";
      lla = "eza -la";
      ls = "eza";
      lt = "eza --tree";
    }
  );
}

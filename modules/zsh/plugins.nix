# modules/zsh/plugins.nix
{ pkgs, ... }:
let
  extraFpaths = builtins.filter builtins.pathExists [
    "${fzfTab}/share/fzf-tab"
    "${fzfTab}/share/zsh/site-functions"
    "${fzfTab}/share/zsh/vendor-completions"
  ];
  fzfTab = pkgs.zsh-fzf-tab;
in
{
  config.zshrc = {
    plugin-fpath = /* zsh */ ''
      fpath+=(${builtins.concatStringsSep " " extraFpaths})
    '';

    plugin-source = /* zsh */ ''
      source "${fzfTab}/share/fzf-tab/fzf-tab.plugin.zsh"
      zstyle ':fzf-tab:*' fzf-flags ''${(z)FZF_DEFAULT_OPTS}
    '';
  };
}

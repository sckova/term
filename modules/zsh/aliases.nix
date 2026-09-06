# modules/zsh/aliases.nix
{
  config.zshrc.aliases = /* zsh */ ''
    alias -- :q=exit
    alias -- cat=bat
    alias -- eza='eza --icons auto --color always --git'
    alias -- ga='git add -v .'
    alias -- gac='git add -v . && git commit'
    alias -- gaca='git add -v . && git commit --amend --no-edit'
    alias -- gd='git diff'
    alias -- gl='git log'
    alias -- gp='git push'
    alias -- gpf='git push --force'
    alias -- gzip=pigz
    alias -- la='eza -a'
    alias -- ll='eza -l'
    alias -- lla='eza -la'
    alias -- ls=eza
    alias -- lt='eza --tree'
  '';
}

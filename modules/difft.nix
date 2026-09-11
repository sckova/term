# modules/difft.nix
{
  programs.difftastic = {
    options = {
      # more traditional git layout
      display = "inline";
      sort-paths = true;
    };

    enable = true;
  };
}

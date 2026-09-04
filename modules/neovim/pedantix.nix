# modules/neovim/pedantix.nix
{
  pkgs,
  termInputs,
  ...
}:
{
  programs.pedantix = {
    enable = true;
    package = termInputs.pedantix.packages.${pkgs.stdenv.hostPlatform.system}.default;

    settings = {
      attrs = {
        blank-lines = 1; # number of blank lines between bindings
        flatten = true; # flatten single subvalues into their parent
        merge = true; # merge into nested sets
      };

      format-after-sort = false;
      format-before-sort = false;
      formatter = "off"; # use nixfmt via nixd
      # reorder things
      lets.sort = true;

      overrides = [
        {
          lists.sort = true;
          path = "**.packages";
        }
        {
          lists.sort = true;
          path = "**.imports";
        }
      ];

      preset = "nixos-module";
    };
  };
}

# lib/options.nix
{ lib, ... }: {
  options.kovaterm = {
    email = lib.mkOption {
      default = "";
      type = lib.types.str;
    };

    name = lib.mkOption {
      default = "";
      type = lib.types.str;
    };
  };
}

# lib/options.nix
{ lib, ... }: {
  options = {
    email = lib.mkOption {
      type = lib.types.str;
    };

    name = lib.mkOption {
      type = lib.types.str;
    };
  };
}

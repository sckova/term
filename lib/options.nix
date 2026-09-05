# lib/options.nix
{ lib, ... }: {
  options = {
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

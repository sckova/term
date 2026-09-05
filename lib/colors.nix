# lib/colors.nix
{
  config,
  lib,
  options,
  ...
}:
let
  base24Slots = [
    "base00"
    "base01"
    "base02"
    "base03"
    "base04"
    "base05"
    "base06"
    "base07"
    "base08"
    "base09"
    "base0A"
    "base0B"
    "base0C"
    "base0D"
    "base0E"
    "base0F"
    "base10"
    "base11"
    "base12"
    "base13"
    "base14"
    "base15"
    "base16"
    "base17"
  ];
in
{
  options = {
    colors = {
      accent = lib.mkOption {
        default = "base0E";
        description = "Accent color slot key used across the configuration.";
        type = lib.types.str;
      };

      schemeName = lib.mkOption {
        default = "catppuccin-mocha";
        description = "Name of the active color scheme.";
        type = lib.types.str;
      };
    };

    palette =
      lib.genAttrs base24Slots (
        slot:
        lib.mkOption {
          default =
            if
              (options ? scheme)
              && (config ? scheme)
              && (config.scheme ? ${slot})
              && (config.scheme.${slot} != null)
            then
              lib.removePrefix "#" config.scheme.${slot}
            else
              {
                base00 = "1e1e2e";
                base01 = "313244";
                base02 = "45475a";
                base03 = "6c7086";
                base04 = "a6adc8";
                base05 = "cdd6f4";
                base06 = "f5e0dc";
                base07 = "b4befe";
                base08 = "f38ba8";
                base09 = "fab387";
                base0A = "f9e2af";
                base0B = "a6e3a1";
                base0C = "94e2d5";
                base0D = "89b4fa";
                base0E = "cba6f7";
                base0F = "f2cdcd";
                base10 = "181825";
                base11 = "11111b";
                base12 = "eba0ac";
                base13 = "f5e0dc";
                base14 = "a6e3a1";
                base15 = "89dceb";
                base16 = "74c7ec";
                base17 = "f5c2e7";
              }
              .${slot};

          description = "Hex color, six digits, no leading '#'.";
          type = lib.types.strMatching "[0-9A-Fa-f]{6}";
        }
      )
      // {
        withHashtag = lib.mkOption {
          default = lib.genAttrs base24Slots (slot: "#" + config.palette.${slot});
          description = "Mirror of `config.palette.*`, each value prefixed with '#'.";
          readOnly = true;
          type = lib.types.attrsOf lib.types.str;
        };
      };
  };
}

# modules/neovim/colors.nix
{ config, ... }:
{
  programs.nixvim = {
    colorschemes.base16 = {
      enable = true;

      colorscheme =
        let
          cleanScheme = {
            inherit (config.palette.withHashtag)
              base00
              base01
              base02
              base03
              base04
              base05
              base06
              base07
              base08
              base09
              base0A
              base0B
              base0C
              base0D
              base0E
              base0F
              ;
          };
        in
        cleanScheme
        // {
          base08 = config.palette.withHashtag.${config.colors.accent};
        }
        // (
          if (builtins.elem config.colors.accent (builtins.attrNames cleanScheme)) then
            { ${config.colors.accent} = cleanScheme.base08; }
          else
            { }
        );

      setUpBar = false;
    };

    # enable transparency
    highlight =
      with config.palette.withHashtag;
      {
        CursorLineNr = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        EndOfBuffer = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        # the color of the fold icons and backdrop
        FoldColumn = {
          bg = "NONE";
          fg = base04;
        };

        # the color of the actual folded text line
        Folded = {
          bg = "NONE";
          fg = base03;
        };

        LineNr = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        Normal = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        NormalFloat = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        NormalNC = {
          bg = "NONE";
          ctermbg = "NONE";
        };

        SignColumn = {
          bg = "NONE";
          ctermbg = "NONE";
        };
      }
      # gitsigns colors
      // {
        GitSignsAdd = {
          bg = "NONE";
          fg = base0B;
        };

        GitSignsChange = {
          bg = "NONE";
          fg = base0D;
        };

        GitSignsChangedelete = {
          bg = "NONE";
          fg = base0E;
        };

        GitSignsDelete = {
          bg = "NONE";
          fg = base08;
        };

        GitSignsStagedAdd = {
          bg = "NONE";
          fg = base0B;
        };

        GitSignsStagedChange = {
          bg = "NONE";
          fg = base0D;
        };

        GitSignsStagedChangedelete = {
          bg = "NONE";
          fg = base0E;
        };

        GitSignsStagedDelete = {
          bg = "NONE";
          fg = base08;
        };

        GitSignsStagedTopdelete = {
          bg = "NONE";
          fg = base08;
        };

        GitSignsStagedUntracked = {
          bg = "NONE";
          fg = base0B;
        };

        GitSignsTopdelete = {
          bg = "NONE";
          fg = base08;
        };

        GitSignsUntracked = {
          bg = "NONE";
          fg = base0B;
        };
      };
  };
}

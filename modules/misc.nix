# modules/misc.nix
{
  config,
  lib,
  pkgs,
  ...
}:
{
  home = {
    file.".gnupg/gpg-agent.conf".text = ''
      pinentry-program ${
        if pkgs.stdenv.hostPlatform.isLinux then
          "${pkgs.pinentry-curses}/bin/pinentry-curses"
        else
          "${pkgs.pinentry_mac}/bin/pinentry-mac"
      }
    '';

    # cli utilities
    packages =
      with pkgs;
      [
        difftastic
        ffmpeg
        jq
        ncdu
        nixd
        pigz
        rclone
        rsync
        wget
      ]
      ++ lib.optionals pkgs.stdenv.hostPlatform.isLinux [
        fh # build is currently broken in darwin
        waypipe
        wl-clipboard
      ]
      # most of these are to provide up-to-date versions of system utils
      ++ lib.optionals pkgs.stdenv.hostPlatform.isDarwin [
        coreutils
        curl
        findutils
        gawk
        gnugrep
        gnupg
        gnused
        gnutar
        pinentry_mac
      ];

    sessionVariables = {
      # allow `nh os` to run without specified dir
      NH_OS_FLAKE = config.home.homeDirectory + "/Projects/nix";
    };
  };

  programs = {
    eza = {
      enable = true;
      colors = "always";
      git = true;
      icons = "auto";
    };

    fd.enable = true;
    nh.enable = true;
    ripgrep.enable = true;
    tmux.enable = true;
  };

  programs = {
    bat = {
      config = {
        style = "changes";
        theme = "base16";
      };

      enable = true;
    };

    fzf = {
      enable = true;

      colors = with config.palette.withHashtag; {
        bg = "-1"; # transparent
        "bg+" = "-1"; # transparent
        border = base03;
        fg = base05;
        "fg+" = base05;
        header = base08;
        hl = base08;
        "hl+" = config.palette.withHashtag.${config.colors.accent};
        info = config.palette.withHashtag.${config.colors.accent};
        label = base05;
        marker = base07;
        pointer = base06;
        prompt = config.palette.withHashtag.${config.colors.accent};
        "selected-bg" = base02;
        spinner = base06;
      };

      defaultOptions = [
        "--height 20%"
        "--border"
        ''--border="rounded"''
        ''--preview-window="border-rounded"''
      ];
    };

    lazysql.enable = true;
  };
}

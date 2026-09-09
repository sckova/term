# modules/neovim/app.nix
{
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
    xdg.desktopEntries.nvim = {
      actions.new-window = {
        exec = "ghostty --class=org.neovim.nvim -e nvim -c \"FzfLua files\" %F";
        name = "New Window";
      };

      categories = [
        "Utility"
        "TextEditor"
      ];

      comment = "Edit text files in your terminal";
      exec = "ghostty --class=org.neovim.nvim -e nvim -c \"FzfLua files\" %F";
      genericName = "Text Editor";
      icon = "nvim";

      mimeType = [
        "text/english"
        "text/plain"
        "text/x-makefile"
        "text/x-c++hdr"
        "text/x-c++src"
        "text/x-chdr"
        "text/x-csrc"
        "text/x-java"
        "text/x-moc"
        "text/x-pascal"
        "text/x-tcl"
        "text/x-tex"
        "application/x-shellscript"
        "text/x-c"
        "text/x-c++"
        "text/markdown"
        "application/json"
      ];

      name = "Neovim";
      settings.StartupWMClass = "org.neovim.nvim";
      terminal = false;
      type = "Application";
    };
  };
}

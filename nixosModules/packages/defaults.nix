{ pkgs, lib, config, ... }:

{
  xdg.mime.defaultApplications =
  {
    "x-scheme-handler/http" = "floorp.desktop";
    "x-scheme-handler/https" = "floorp.desktop";
    "text/html" = "floorp.desktop";
    "application/xhtml+xml" = "floorp.desktop";
  };
}

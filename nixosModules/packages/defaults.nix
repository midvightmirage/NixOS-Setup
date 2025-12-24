{ pkgs, lib, config, ... }:

{
  # Default Applications
    xdg.mime.defaultApplications =
    {
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
      "text/html" = "floorp.desktop";
      "application/xhtml+xml" = "floorp.desktop";
      #"x-scheme-handler/mailto" = "thunderbird.desktop";
      #"text/plain" = "kate.desktop";
      #"application/pdf" = "okular.desktop";
      #"image/*" = "gwenview.desktop";
      #"audio/*" = "vlc.desktop";
      #"video/*" = "vlc.desktop";
    };
}

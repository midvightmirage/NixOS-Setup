{ pkgs, lib, config, ... }:

{
    imports =
    [
    ./packages/overrides.nix
    ./packages/defaults.nix
    ./packages/entries.nix
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  # System-wide packages installed for all users
  environment.systemPackages = with pkgs;
  [
    pkgs.home-manager
    # Basic Utilities
    pkgs.btop
    pkgs.hyfetch
    # Add system-wide packages here
    # Examples:
    # vim
    # wget
    # git
  ];

  # User-specific packages for 'madeline'
  users.users.madeline =
  {
    packages = with pkgs;
    [
      # General Purpose
      kdePackages.kate
      pkgs.floorp-bin
      pkgs.tor-browser
      pkgs.legcord
      pkgs.obsidian

      # Research
      pkgs.wireshark

      # Development
      pkgs.jetbrains.rider
      pkgs.jetbrains.rust-rover
      pkgs.jetbrains.ruby-mine
      pkgs.jetbrains.pycharm
      pkgs.jetbrains.webstorm
      pkgs.jetbrains.phpstorm
      pkgs.jetbrains.mps
      (pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.idea [ "nixidea" ])
      pkgs.jetbrains.clion
      pkgs.jetbrains.goland
      pkgs.jetbrains.dataspell
      pkgs.jetbrains.datagrip
      pkgs.jetbrains.gateway
      pkgs.warp-terminal

      #pkgs.winboat

      # Content Creation
      pkgs.bitwig-studio
      pkgs.davinci-resolve
      # godot

      # Content Consumption
      # music app here
      pkgs.steam
      pkgs.adwsteamgtk
      # thunderbird
      # firefox
    ];
  };

  programs.steam =
  {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };

  programs.wireshark.enable = true;

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

  # Desktop Entries
}
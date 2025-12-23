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
    rocmPackages.rocminfo
    clinfo
    btop
    hyfetch
    # Add system-wide packages here
    # Examples:
    # vim
    # wget
    # git
  ];

  users.users.madeline =
  {
    packages = with pkgs;
    [
      # General Purpose
      kdePackages.kate
      floorp-bin
      tor-browser
      legcord
      obsidian

      # Research
      wireshark

      # Development
      jetbrains.rider
      jetbrains.rust-rover
      jetbrains.ruby-mine
      jetbrains.pycharm
      jetbrains.webstorm
      jetbrains.phpstorm
      jetbrains.mps
      (jetbrains.plugins.addPlugins pkgs.jetbrains.idea [ "nixidea" ])
      jetbrains.clion
      jetbrains.goland
      jetbrains.dataspell
      jetbrains.datagrip
      jetbrains.gateway
      warp-terminal

      #pkgs.winboat

      # Content Creation
      bitwig-studio
      davinci-resolve
      # godot

      # Content Consumption
      # music app here
      steam
      adwsteamgtk
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

}
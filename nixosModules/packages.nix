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
    rustup
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
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ]; # doesnt seem to work
  };

  programs.wireshark.enable = true;



}
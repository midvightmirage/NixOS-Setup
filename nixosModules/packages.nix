{ pkgs, lib, config, ... }:

{
    imports =
    [
    <nixpkgs/nixos/modules/programs/plasma-manager.nix>
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
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-kde

    # Basic Utilities
    framework-tool
    kdePackages.plasma-integration
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
      #affinity studio
      # godot
      # obs

      # Games
      # music app here
      steam
      adwsteamgtk
      prismlauncher
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

  programs.plasma.enable = true;
  programs.plasma =
  {
    # Enable blur effect for transparent backgrounds (tooltips, panels, menus)
    kwin.effects.blur =
    {
      enable = true;
      strength = 10;        # 1-15, higher = more blur
      noiseStrength = 5;    # 0-14, adds texture to blur
    };

    # Enable translucency effects
    kwin.effects.translucency.enable = true;

    # Configure panel opacity for better blur integration
    panels =
    {
      opacity = "adaptive";  # "adaptive" | "opaque" | "translucent"
    };
  };

}
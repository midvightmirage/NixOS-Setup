{ pkgs, lib, config, ... }:

{
    imports =
    [
    #<nixpkgs/nixos/modules/programs/plasma-manager.nix>
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
    libreoffice-qt
    hunspell
    hunspellDicts.en_US
    hunspellDicts.de_DE
    hyphenDicts.en_US
    hyphenDicts.de_DE

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
      gparted
      thunderbird-esr
      pidgin
      mumble
      mumble_overlay
      # Privacy & Security
      warp-plus

      # Other

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
      vscodium

      #pkgs.winboat

      # Content Creation
      bitwig-studio
      davinci-resolve
      manuskript
      
      
      gpu-screen-recorder-gtk
      #affinity studio
      blender
      blockbench
      godot
      # obs

      # Games
      # music app here
      steam
      adwsteamgtk
      r2modman
      protonup-qt
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
    extraCompatPackages = [ pkgs.proton-ge-bin ]; # doesnt work
  };

  programs.wireshark.enable = true;
  programs.java =
  {
    enable  = true;
    package = pkgs.openjdk21;
  };
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs;
  [
    gtk3
    glib
    libGL
    xorg.libX11
    xorg.libXtst
    xorg.libXxf86vm
    xorg.libXext
    libglvnd
  ];
  services.murmur =
  {
    enable = true;
    openFirewall = true;
  };
}

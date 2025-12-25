{ config, pkgs, ... }:

{
  imports =
    [
      (import "${builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz"}/nixos")
      ./hardware-configuration.nix
      ./nixosModules/packages.nix
      ./nixosModules/services.nix
      ./nixosModules/variables.nix
      #./nixosModules/scripts.nix

      ./nixosModules/home-manager.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  # Timezone and Internationalization
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocaleSettings =
  {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # User Configuration
  users.users.madeline =
  {
    isNormalUser = true;
    description = "Madeline";
    extraGroups = [ "networkmanager" "wheel" "render" "video"];
  };
  programs.firefox.enable = true; # Temporary Firefox Install

  # Package Configuration
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.rocmSupport = true;

  # Hardware Configuration
  hardware.graphics =
  {
    enable = true;
    extraPackages = with pkgs;
    [
      mesa.opencl # Enables Rusticl (OpenCL) support
      rocmPackages.clr.icd
    ];
  };

  # System Version
  system.stateVersion = "25.11";
}

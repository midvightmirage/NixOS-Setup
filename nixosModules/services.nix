{ config, pkgs, ... }:

{
  # Framework 16 Specific Settings
  services.fprintd.enable = true;
  services.fwupd.enable = true;

  # Enable the X11 windowing system
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Enable the KDE Plasma Desktop Environment
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb =
  {
    layout = "de";
    variant = "";
  };

  # Touchpad Support (optional, enabled by default in most desktop managers)
  # services.xserver.libinput.enable = true;

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire =
  {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # SSH Daemon (uncomment if needed)
  # services.openssh.enable = true;
  # services.openssh.settings =
  # {
  #   permitRootLogin = "no";
  #   passwordAuthentication = false;
  #   kbdInteractiveAuthentication = false;
  # };
}

# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  pkgs,
  config,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  # stylix
  stylix.enable = true;
  # stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/kanagawa.yaml";
  stylix.base16Scheme = {
    base00 = "#181a20";
    base01 = "#23252b";
    base02 = "#282a30";
    base03 = "#393b44";
    base04 = "#a4a7a4";
    base05 = "#c8c093";
    base06 = "#e6e6d1";
    base07 = "#f7f7ec";

    base08 = "#b8a273";
    base09 = "#a4a282";
    base0A = "#c4b28a";
    base0B = "#8a9a7b";
    base0C = "#8ea4a2";
    base0D = "#8ba4b0";
    base0E = "#a292a3";
    base0F = "#393b44";
  };
  stylix.cursor.package = pkgs.phinger-cursors;
  stylix.cursor.name = "phinger-cursors-dark";
  stylix.cursor.size = 20;
  stylix.fonts = {
    monospace = {
      package = pkgs.nerd-fonts.jetbrains-mono;
      name = "JetBrainsMono Nerd Font";
    };
    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };
    serif = {
      package = pkgs.source-serif-pro;
      name = "Source Serif Pro";
    };
  };
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "uinput" ];
  networking.hostName = "gtx-nix"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  hardware.opentabletdriver.enable = true;
  hardware.uinput.enable = true;
  services.udev.extraRules = ''
    KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
  '';

  # Ensure the uinput group exists
  users.groups.uinput = { };

  # Add the Kanata service user to necessary groups
  systemd.services.kanata-internalKeyboard.serviceConfig = {
    SupplementaryGroups = [
      "input"
      "uinput"
    ];
  };
  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  programs.zsh.enable = true;
  users.users.abhi = {
    isNormalUser = true;
    description = "Abhirath Agasanakoppa";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [ ];
    shell = pkgs.zsh;
  };

  # Allow unfree packages
  nixpkgs = {
    overlays = [ inputs.abhivim.overlays.default ];
    config.allowUnfree = true;
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "ca-derivations"
  ];
  nix.settings = {
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    # nvidiaPatches = true;
    xwayland.enable = true;
  };
  services.displayManager.ly.enable = true;
  services.displayManager.ly.settings.pam = true;
  services.kanata = {
    enable = true;
    keyboards = {
      internalKeyboard = {
        devices = [
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:13:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usbv2-0:1:1.0-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:13:1.2-event-kbd"
          "/dev/input/by-path/pci-0000:00:14.0-usb-0:1:1.0-event-kbd"
        ];
        config = ''
          (defsrc
            caps)

          (deflayer base
            esc)
        '';
      };
    };
  };
  # services.greetd = {
  #   enable = true;
  #   settings = {
  #     default_sesion = "hyprland";
  #     user = "abhi";
  #   };
  #   package = pkgs.greetd.gtkgreet;
  # };
  # environment.sessionVariables = {
  #   opengl.enable = true;
  #   # nvidia.modesetting.enable = true;
  # };
  # List services that you want to enable:
  services.xserver.videoDrivers = [ "nvidia" ]; # Even if you use Hyprland, this ensures the kernel module is loaded
  hardware.graphics.enable = true;
  hardware.nvidia = {
    open = false;
    modesetting.enable = true;
    powerManagement.enable = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}

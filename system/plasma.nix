{ config, lib, pkgs, configuration, ... }: {
  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    konsole
    okular
    kate
    khelpcenter
  ];

  # TODO: plasma settings to configure
  # - Theme: Dark
  # - Mouse: disable acce
  # - Mouse: razer - speed -0.40
  # - Accessability: shake mouse - disable
  # - Screen lock: never
  # - Power: screen off - never
  # - Panel: dodge windows
  # - Panel: translucent
  # - Pined apps: settings, files, ghostty, browser

  # Start sunshine server
  services.sunshine = {
    enable = true;
    autoStart = true;
    capSysAdmin = true;
    openFirewall = true;  
  };

  # Enable sound.
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
}


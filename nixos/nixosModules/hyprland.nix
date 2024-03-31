{
  config,
  pkgs,
  lib,
  ...
}: {
  security.polkit.enable = true;
  security.rtkit.enable = true;

  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  console.keyMap = "fr";

  environment.systemPackages = with pkgs; [
    kitty
    rofi-wayland
    waybar
    swww
    dunst
    libnotify
    lxqt.lxqt-policykit
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}

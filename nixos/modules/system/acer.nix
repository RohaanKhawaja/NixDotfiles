# Rohaan's Nix Config - Acer Swift 16 AI 2026 Specific Settings

{ config, pkgs, ... }:

{
  # Touchpad Fix
  # Firmware declares incorrect max value for ABS_MT_PRESSURE (2432 instead of 500) causing all touch inputs to be rejected. Palm rejection is handled in firmware.
  environment.etc."libinput/local-overrides.quirks".text = ''
    [Pixart Touchpad (093A:4813)]
    MatchBus=i2c
    MatchUdevType=touchpad
    MatchVendor=0x093A
    MatchProduct=0x4813
    AttrEventCode=-ABS_MT_PRESSURE;-ABS_PRESSURE;-ABS_MT_DISTANCE;-ABS_MT_TOUCH_MAJOR;-ABS_MT_TOUCH_MINOR
  '';

  # Enable Linux Firmware Update Manager
  services.fwupd.enable = true;

  # Palm rejection solution
  services.libinput = {
    enable = true;
    touchpad = {
      disableWhileTyping  = true;
      tapping             = true;
      naturalScrolling    = true;
      clickMethod         = "clickfinger";
      accelProfile        = "flat";
      #sendEventsMode     = "disabled-on-external-mouse";
    };
  };
  services.libinput.touchpad.additionalOptions = ''
    Option "PalmDetection" "on"
    Option "PalmMinWidth" "8"
    Option "PalmMinZ" "100"
  '';

}

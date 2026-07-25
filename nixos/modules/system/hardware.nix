# Rohaan's Nix Config - Hardare Settings

{ config, pkgs, ... }:

{
  # Enable GPU Acceleration (intel GPU)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages  = with pkgs; [
      intel-media-driver	              # Intel hardware video decode
      intel-compute-runtime	            # OpenCL support for intel Arc
      nvtopPackages.intel	              # GPU Resource Monitor for Intel GPUs
    ];
  };

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
  };

  # Enable Razer Hardware
  hardware.openrazer.enable = true;

  # Enable Upower
  services.upower.enable = true;

}

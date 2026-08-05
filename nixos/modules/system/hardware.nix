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

  # Enable thunderbolt
  services.hardware.bolt.enable = true;
  boot.kernelParams = [ "ucsi_acpi.disable_runtime_pm=1" ];

  # Enable Bluetooth
  hardware.bluetooth = {
    enable = true;
  };

  # Enable Razer Hardware
  hardware.openrazer.enable = true;

  # Enable Upower
  services.upower.enable = true;

}

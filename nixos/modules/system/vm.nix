# Rohaan's NixOS Config - Virtualisation Settings

{ config, pkgs, ... }:

{
  # Enable QEMU/KVM virtualisation
  virtualisation.libvirtd = {
    enable          = true;
    qemu.swtpm.enable = true;   # TPM emulation (required for Windows 11)
  };

  # Enable virt-manager GUI
  programs.virt-manager.enable = true;

  # Add user to libvirtd group
  users.users.${config.myConfig.username}.extraGroups = [ "libvirtd" ];

  # Enable spice for better VM display/clipboard integration
  environment.systemPackages = with pkgs; [
    virt-manager              # VM management GUI
    virt-viewer               # VM display client
    spice-gtk                 # SPICE protocol support
    virtio-win                # VirtIO drivers for Windows
    swtpm                     # TPM emulation
  ];

  # Enable network bridge for VMs
  virtualisation.libvirtd.allowedBridges = [ "virbr0" ];
}

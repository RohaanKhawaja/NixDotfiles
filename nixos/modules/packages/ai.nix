# Rohaan's NixOS Config - AI/ML Tools

{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ollama-vulkan             # Ollama CLI - using vulkan backend for compatibility
    openvino                  # Open Source tookit for AI
  ];
}

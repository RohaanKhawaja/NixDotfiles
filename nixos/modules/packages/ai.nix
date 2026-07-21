# Rohaan's NixOS Config - AI/ML Tools

{ config, pkgs, ... }:

{
  # Enable Ollama service
  services.llama-cpp = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    ollama                    # Ollama CLI
    openvino                  # Open Source tookit for AI
  ];
}

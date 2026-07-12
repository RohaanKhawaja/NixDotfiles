# Rohaan's NixOS Config - Developer Packages

{ config, pkgs, ... }:

# List of Python Packages + Python 3
let
  myPython = pkgs.python3.withPackages (ps: with ps; [
    pip                       # Python Package Manager
    virtualenv                # Virtual Environments
    manim                     # Mathematical Animation Engine
  ]);
in

{

  environment.systemPackages = with pkgs; [
    # Compilers
    gcc                       # C/C++ Compiler
    llvmPackages.clang        # C/C++ Compiler (Clang/LLVM)
    myPython                  # Python3 + Above packages
    texliveFull               # LaTeX
    openjdk17                 # Java (JDK)
    zig                       # Zig Compiler

    # Build Systems
    cmake                     # Cross-platform Build System
    meson                     # Build system
    ninja                     # Build system backend

    # Alternatives
    octave                    # GNU Octave (MATLAB-like)

    # Arduino
    arduino-ide               # Arduino IDE
    arduino-cli               # Arduino CLI

  ];

}

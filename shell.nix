{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    pkg-config
    wayland-scanner
  ];

  buildInputs = with pkgs; [
    wayland
    wayland-protocols
    wlroots_0_19  # Matches the wlroots-0.19 in your build output
    libinput
    libxkbcommon
    libGL
    pixman
  ];
}


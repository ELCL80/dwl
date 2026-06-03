{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    pname = "dwl";
    version = "0.8-dev";

    src = ./.;

    nativeBuildInputs = with pkgs; [
        pkg-config
        wayland-scanner
    ];

    buildInputs = with pkgs; [
        wayland
        wayland-protocols
        wlroots_0_19
        libinput
        libxkbcommon
        libGL
        pixman
        xwayland
    ];

    makeFlags = [ 
        "PREFIX=$(out)" 
        "MANDIR=$(out)/share/man"
        "DATADIR=$(out)/share"
    ];

    meta = with pkgs.lib; {
        description = "Dynamic window manager for Wayland";
        homepage = "https://github.com";
        license = licenses.gpl3Only;
        platforms = platforms.linux;
    };
}


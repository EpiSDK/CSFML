{ lib
, stdenv
, fetchFromGitHub
, cmake
, freetype
, openal
, flac
, libvorbis
, libjpeg
, udev
, libX11
, libXrandr
, libXcursor
, libXi
, libGL
, libGLU
, pkg-config
}:

stdenv.mkDerivation rec {
  pname = "sfml";
  version = "2.6.1";

  src = fetchFromGitHub {
    owner = "SFML";
    repo  = "SFML";
    rev   = version;
    hash  = "sha256-R+ULgaKSPadcPNW4D2/jlxMKHc1L9e4FprgqLRuyZk4=";
  };

  nativeBuildInputs = [ cmake pkg-config ];

  buildInputs = [
    freetype
    openal
    flac
    libvorbis
    libjpeg
    udev
    libX11
    libXrandr
    libXcursor
    libXi
    libGL
    libGLU
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DSFML_BUILD_EXAMPLES=OFF"
    "-DSFML_BUILD_DOC=OFF"
    "-DSFML_INSTALL_PKGCONFIG_FILES=OFF"
  ];

  meta = with lib; {
    description = "Simple and Fast Multimedia Library (2.6.1)";
    homepage    = "https://www.sfml-dev.org/";
    license     = licenses.zlib;
    platforms   = platforms.linux;
  };
}
{ lib
, stdenv
, fetchFromGitHub
, cmake
, sfml261
, freetype
, openal
, flac
, libvorbis
, libjpeg
, udev
}:

stdenv.mkDerivation rec {
  pname = "csfml";
  version = "2.6.1";

  src = fetchFromGitHub {
    owner = "SFML";
    repo  = "CSFML";
    rev   = version;
    hash  = "sha256-ECt0ySDpYWF0zuDBSnQzDwUm4Xj4z1+XSC55D6yivac=";
  };

  nativeBuildInputs = [ cmake ];

  buildInputs = [
    sfml261
    freetype
    openal
    flac
    libvorbis
    libjpeg
    udev
  ];

  cmakeFlags = [
    "-DCMAKE_BUILD_TYPE=Release"
    "-DCSFML_INSTALL_PKGCONFIG_FILES=OFF"
    "-DSFML_DIR=${sfml261}/lib/cmake/SFML"
  ];

  meta = with lib; {
    description = "Official C binding for SFML (2.6.1)";
    homepage    = "https://www.sfml-dev.org/download/csfml/";
    license     = licenses.zlib;
    platforms   = platforms.linux;
  };
}
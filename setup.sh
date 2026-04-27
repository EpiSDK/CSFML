#!/bin/sh

nix build .#sfml .#csfml
nix profile add .#sfml .#csfml
echo '# SET env in your nix conf'
echo 'export LIBRARY_PATH=$HOME/.nix-profile/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/.nix-profile/include:$C_INCLUDE_PATH
export CPATH=$HOME/.nix-profile/include:$CPATH
export PKG_CONFIG_PATH=$HOME/.nix-profile/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/.nix-profile/lib:$LD_LIBRARY_PATH'

export LIBRARY_PATH=$HOME/.nix-profile/lib:$LIBRARY_PATH
export C_INCLUDE_PATH=$HOME/.nix-profile/include:$C_INCLUDE_PATH
export CPATH=$HOME/.nix-profile/include:$CPATH
export PKG_CONFIG_PATH=$HOME/.nix-profile/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$HOME/.nix-profile/lib:$LD_LIBRARY_PATH

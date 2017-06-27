{ stdenv, fetchurl, patchelf, procps, makeWrapper,
  ncurses, zlib, libX11, libXrender, libxcb, libXext, libXtst,
  libXi, glib, freetype, gtk2 }:

stdenv.mkDerivation rec {
  name = "vivado-2017.2";

  buildInputs = [ patchelf procps ncurses makeWrapper ];
  
  builder = ./builder.sh;
  inherit ncurses;
    
  src = fetchurl {
    url = "http://localhost:9000/Xilinx_Vivado_SDK_2017.2_0616_1.tar.gz";
    sha256 = "32b98ffb8d0de79be4e053b0616639c76045a29f3bf9f921e4949bf32527eb1a";
  };

  libPath = stdenv.lib.makeLibraryPath
    [ stdenv.cc.cc ncurses zlib libX11 libXrender libxcb libXext libXtst libXi glib
      freetype gtk2 ];
  
  meta = {
    description = "Xilinx Vivado";
    homepage = "https://www.xilinx.com/products/design-tools/vivado.html";
    license = stdenv.lib.licenses.unfree;
  };
}

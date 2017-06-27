{ stdenv, fetchFromGitHub, python, buildPythonPackage,
  colorama, sphinx, sphinx_rtd_theme, verilator }:

buildPythonPackage rec {
  version = "git-09a9fc";
  pname = "migen";
  name = "${pname}-${version}";
  
  src = fetchFromGitHub {
    owner = "m-labs";
    repo = "migen";
    rev = "09a9fc9b584005a37e3ab9ceee0570890700bf46";
    sha256 = "0dxqgyb8xavryy4kjg12i5vaqxd8lnx2dlf7rhyzih1k2fnhmdfs";
  };
  
  propagatedBuildInputs = [ colorama sphinx sphinx_rtd_theme verilator ];

  meta = with stdenv.lib; {
    description = "A Python toolbox for building complex digital hardware";
    homepage    = "https://m-labs.hk/gateware.html";
    license     = licenses.bsd2;
    platforms   = platforms.unix;
  };
}

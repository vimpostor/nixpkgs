{ lib
, stdenv
, fetchFromGitHub
, cmake
# for passthru.tests
, intel-compute-runtime
, intel-media-driver
}:

stdenv.mkDerivation rec {
  pname = "intel-gmmlib";
  version = "22.3.1";

  src = fetchFromGitHub {
    owner = "intel";
    repo = "gmmlib";
    rev = "intel-gmmlib-${version}";
    sha256 = "sha256-bk1yBxMrPkFnPcV5uvEmbf3X2WG6iJNbD1WNxoOSnA8=";
  };

  nativeBuildInputs = [ cmake ];

  passthru.tests = {
    inherit intel-compute-runtime intel-media-driver;
  };

  meta = with lib; {
    homepage = "https://github.com/intel/gmmlib";
    license = licenses.mit;
    description = "Intel Graphics Memory Management Library";
    longDescription = ''
      The Intel(R) Graphics Memory Management Library provides device specific
      and buffer management for the Intel(R) Graphics Compute Runtime for
      OpenCL(TM) and the Intel(R) Media Driver for VAAPI.
    '';
    platforms = [ "x86_64-linux" "i686-linux" ];
    maintainers = with maintainers; [ SuperSandro2000 ];
  };
}

{ stdenv
, fetchFromGitHub
, cmake
, libglvnd
, x11
}:
stdenv.mkDerivation {
  name = "bear-lib-terminal";
  src = fetchFromGitHub {
    owner = "cfyzium";
    repo = "bearlibterminal";
    rev = "d347d14666671f6118ede40d7b3b3ef82edbd462";
    sha256 = "sha256:02g6x3rvwczw83xzrs3j85x6n3d4765x83jn5h2f1hlpshjdz3gy";
  };
  buildInputs = [
    cmake
    libglvnd
    x11
  ];

  cmakeFlags = [
    "-DOpenGL_GL_PREFERENCE=LEGACY"
    "-DCMAKE_BUILD_TYPE=release"
  ];

  patches = [
    ./cmake-install.patch
  ];
}

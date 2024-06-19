{pkgs }: 
  pkgs.buildGoModule {
    pname = "ardugotools";
    version = "v0.5.1";
    vendorHash = "sha256-Z9ObsS+GwVsz6ZlXCgN0WlShHzbmx4WLa/1/XLSSAAs=";
    src = pkgs.fetchFromGitHub {
      owner = "randomouscrap98";
      repo = "ardugotools";
      rev = "v0.5.1";
      hash = "sha256-c+sJoE5NML06bl6ch+OiN1vO0rdyE2gf/z4pzY7i5Qk=";
    };
    nativeBuildInputs = with pkgs; [
      go
    ];
  }

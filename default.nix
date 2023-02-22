with (import <nixpkgs> {});

stdenv.mkDerivation {
  pname = "doctools";
  version = "1.0.0";

  src = ./.;

  buildPhase = ''
    substituteInPlace ./doctools.sh --replace "./scripts" "$out/share/scripts"
    substituteInPlace ./scripts/*.sh --replace "./scripts" "$out/share/scripts"
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp ./doctools.sh $out/bin/dt
    mkdir -p $out/share
    cp -r ./scripts $out/share/scripts
    mkdir -p $out/share/bash-completion/completions
    cp ./doctools.autocomplete.bash $out/share/bash-completion/completions/dt
    mkdir -p $out/share/fish/vendor_completions.d
    cp ./doctools.autocomplete.fish $out/share/fish/vendor_completions.d/dt.fish
  '';
}

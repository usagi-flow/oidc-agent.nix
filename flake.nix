{
	description = "A set of tools to manage OpenID Connect tokens and make them easily usable from the command line.";

	inputs = {
		nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
		flake-utils.url = "github:numtide/flake-utils";
	};

	outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
		let
			pkgs = import nixpkgs { inherit system; };
			oidc-agent = (with pkgs; stdenv.mkDerivation {
				pname = "oidc-agent";
				version = "4.5.2";
				src = fetchgit {
					url = "https://github.com/indigo-dc/oidc-agent";
					rev = "v4.5.2";
					sha256 = "UY1/oINgqKAjgDQ7TsHbR/tKhhQCq41ndQ+2H8+0Zt8=";
					#fetchSubmodules = true;
				};
				nativeBuildInputs = [
					pkg-config
					curl
					libsecret
					libsodium
					libmicrohttpd
					qrencode
					webkitgtk
				];
				buildPhase = "make build";
				installPhase = "mkdir -p $out/bin; install -t $out/bin bin/*";
			});
		in rec {
			defaultApp = flake-utils.lib.mkApp { drv = defaultPackage; };
			defaultPackage = oidc-agent;
		}
	);
}

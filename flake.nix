{
  description = "installs rokit and such. honestly super cursed its only really for my usage";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # sandbox configuration
      sandboxcfg = {
        # commit hash of the rokit version to use
        rokit_commit = "2f2618428ef31279e2fc80b0b1d73485bc929ddd";
        # max GiB for the sandbox's filesystem
        max_filesystem_GiB = "4";
      };

      signalisShellScript = pkgs.writeShellScriptBin "signalisShellScript" ''
        echo "running project setup..."
        if command -v rokit >/dev/null 2>&1; then
          echo "rokit is already installed in tmp, using cached binaries."
        else
          echo "running rokit install script for ${sandboxcfg.rokit_commit}"
          curl -sSf "https://raw.githubusercontent.com/rojo-rbx/rokit/${sandboxcfg.rokit_commit}/scripts/install.sh" | bash
          rokit install --no-trust-check
        fi

        command -v ldd >/dev/null || { echo "ldd not in sandbox" >&2; exit 1; }

        storage="''${HOME}/.rokit/tool-storage"
        clean=1

        while IFS= read -r -d ''' bin; do
          IFS= read -r -N 4 magic < "''$bin" 2>/dev/null || continue
          [[ ''$magic == ''$'\x7fELF' ]] || continue

          missing=''$(ldd "''$bin" 2>/dev/null | grep 'not found')
          if [ -n "''$missing" ]; then
            clean=0
            printf 'missing in: %s\n' "''$bin"
            printf '%s\n' "''$missing" | sed 's/^[[:space:]]*/    /'
          fi
        done < <(find "''$storage" -type f -print0 2>/dev/null)

        (( clean )) && echo "all rokit links working"
        sleep .5
        read -p "[ENTER] to finish setup''\n"
        ${pkgs.bashInteractive}/bin/bash
      '';
    in
    {
      devShells.${system}.default =
        (pkgs.buildFHSEnv {
          name = "sandbox";
          privateTmp = true;
          targetPkgs =
            pkgs: with pkgs; [
              signalisShellScript
              openssl # wally
              zlib # wally
              dbus # pesde
              nodejs # npm package
              stdenv.cc.cc.lib
            ];
          runScript = "signalisShellScript";
        }).env;
    };
}

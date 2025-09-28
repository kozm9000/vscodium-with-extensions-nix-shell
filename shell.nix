# Nix-shell configuration for Vscodium/VSCode with custom extensions
# Run "nix-shell --arg allowUnfree true" for VSCode
# OR set - "allowUnfree ? true,"  on line 5 to use VSCode as default and run "nix-shell" without --arg.
{
  allowUnfree ? false,
  useVsCode ? false,
}:
let
  # Configure package settings based on allowUnfree flag
  config = {
    allowUnfree = if useVsCode == true then true else (if allowUnfree == true then true else false);
  };
  # Import Nixpkgs with our configuration
  pkgs = import <nixpkgs> { inherit config; };
  # Define a custom VSCode derivation with extensions
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
    # Select VSCode (unfree) or Vscodium based on configuration
    vscode = if useVsCode == true then pkgs.vscode else pkgs.vscodium;
    # I. To find extension identifier( publisher.name ):
    #  1. Visit https://marketplace.visualstudio.com/
    #  2. Search and select desired extension
    #  3. Find the identifier in:
    #  3.1 the "Installation" section below the name and publisher
    #  3.2 or in "More Info" section as Unique Identifier
    #  3.3 or in the URL param ?itemName=
    # II. Check that extention is available in nixpgks https://search.nixos.org/packages
    #     Full list of available extensions via nixpkgs can be found at https://search.nixos.org/packages?channel=25.05&query=vscode-extensions.
    # III. If available, paste preferred package below in publisher.name format omitting vscode-extensions. prefix . If not read IV.
    # Adwaita theme as an example below:
    vscodeExtensions =
      with pkgs.vscode-extensions;
      [
        # Adwaita theme
        piousdeer.adwaita-theme
        #  Unfree
        #mhutchie.git-graph
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # IV. If the extension iS not available in nixpkgs:
        #  1. Visit https://marketplace.visualstudio.com/
        #  2. Search and select desired extension
        #  3. Go to "More Info" section and use Unique Identifier ( publusher.name ) and Version
        #  4. Fill in the following codeblock in curly braces leaving sha256 empty
        #        {
        #      name = "";
        #      publisher = "";
        #      version = "";
        #      sha256 = "";
        #    }
        #  5. Run nix-shell and wait for the hash in the error :
        # error: hash mismatch in fixed-output derivation '':
        #     specified: sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=
        #        got:    sha256-rpYgvo5H1RBviV5L/pfDWqVXIYaZonRiqh4TLFGEODw=
        # Fill in the sha256 with value from the error
        #  6. run nix-shell again
        # Eslint example:
        {
          name = "vscode-eslint";
          publisher = "dbaeumer";
          version = "3.0.19";
          sha256 = "sha256-rpYgvo5H1RBviV5L/pfDWqVXIYaZonRiqh4TLFGEODw=";
        }
        # Paste more codeblocks for each extension one after another.
        #{
        #  name = "";
        #  publisher = "";
        #  version = "";
        #  sha256 = "";
        #}
        #{
        #  name = "";
        #  publisher = "";
        #  version = "";
        #  sha256 = "";
        #}
      ];
  };
in
pkgs.mkShellNoCC {
  # Build environment with custom VSCode setup
  packages = [
    vscodeWithExtensions
    # Insert other preferred packages here with pkgs. prefix ( pkgs.python313 )
    # You can also install libraries/modules - pkgs.python313Packages.django
    # To find packages, visit https://search.nixos.org/packages
  ];
  # Automatically run vscodium ( or vscode ) when entering the shell.
  shellHook = if useVsCode == true then "code" else "codium";
}

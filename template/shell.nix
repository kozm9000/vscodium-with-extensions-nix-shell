# Nix-shell configuration for Vscodium/VSCode with custom extensions
# Run "nix-shell --arg useVsCode true" for VSCode
# Run "nix-shell --arg allowUnfree true" to enable unfree extensions while still using VSCodium
# OR set - "useVsCode ? true,"  on line 9 to use VSCode as default and run "nix-shell" without --arg.
# Disable or enable entire extension packs by setting the corresponding flag to true or false.
# Add your preferred extensions to ../modules/user-extensions.nix
{
  allowUnfree ? false,
  useVsCode ? false,
  enableUniversalExtensions ? true,
  enableUserExtensions ? true,
}:
let
  # Configure package settings based on flags
  config = {
    allowUnfree = if useVsCode then true else (if allowUnfree then true else false);
  };
  # Import Nixpkgs with our configuration
  pkgs = import <nixpkgs> { inherit config; };
  # If you want yo use predefinded modules import them like this:
  # gitExtensions = import ../modules/git.nix { inherit pkgs; } else [];
  # Add gitExtensions to allExtensions on line 26 (allExtensions = userExtensions ++ universalExtensions ++ gitExtensions )
  userExtensions = if enableUserExtensions then import ../modules/user-extensions.nix { inherit pkgs; } else [];
  universalExtensions = if enableUniversalExtensions then import ../modules/universal.nix { inherit pkgs; } else [];
  allExtensions = userExtensions ++ universalExtensions ;
  # Define a custom VSCode derivation with extensions
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
    # Select VSCode (unfree) or Vscodium based on flags
    vscode = if useVsCode then pkgs.vscode else pkgs.vscodium;
    vscodeExtensions = allExtensions;
  };
in
pkgs.mkShellNoCC {
  # Build environment with custom VSCode setup
  packages = [
    vscodeWithExtensions
    # Insert other preferred packages here with pkgs. prefix ( e.g. pkgs.python313 pkgs.nodejs_22)
    # You can also install libraries/modules - ( e.g. pkgs.python313Packages.django nodePackages.svgo)
    # To find packages, visit https://search.nixos.org/packages
  ];
  # Automatically run vscodium ( or vscode ) when entering the shell.
  shellHook = if useVsCode then "code" else "codium";
}

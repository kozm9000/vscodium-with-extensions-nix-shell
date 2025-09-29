# Nix-shell configuration for Vscodium/VSCode with custom extensions for Next.js
# Run "nix-shell --arg useVsCode true" for VSCode
# Run "nix-shell --arg allowUnfree true" to enable unfree extensions while still using VSCodium
# OR set - "useVsCode ? true,"  on line 7 to use VSCode as default and run "nix-shell" without --arg.
# Disable or enable entire extension packs by setting the corresponding flag to true or false.
# Add you own preferred extensions to ../modules/user-extensions.nix
{
  allowUnfree ? false,
  useVsCode ? false,
  enableGitExtensions ? true,
  enableHtmlCssExtensions ? true,
  enableJsTsExtensions ? true,
  enableMarkdownExtensions ? true,
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
  gitExtensions = if enableGitExtensions then import ../modules/git.nix { inherit pkgs; } else [];
  htmlCssExtensions = if enableHtmlCssExtensions then import ../modules/html-css.nix { inherit pkgs;} else [];
  jsTsExtensions = if enableJsTsExtensions then import ../modules/js-ts-base.nix { inherit pkgs;} else [];
  markdownExtensions = if enableMarkdownExtensions then import ../modules/markdown.nix { inherit pkgs;} else [];
  userExtensions = if enableUserExtensions then import ../modules/user-extensions.nix { inherit pkgs; } else [];
  universalExtensions = if enableUniversalExtensions then import ../modules/universal.nix { inherit pkgs; } else [];
  angularExtensions = import ./angular.nix { inherit pkgs; };
  allExtensions = gitExtensions ++ htmlCssExtensions ++ jsTsExtensions ++ markdownExtensions ++ userExtensions ++ universalExtensions ++ angularExtensions ;
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
  ];
  # Automatically run vscodium ( or vscode ) when entering the shell.
  shellHook = if useVsCode then "code" else "codium";
}

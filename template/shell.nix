# Nix-shell configuration for Vscodium/VSCode with custom extensions
# Run "nix-shell --arg useVsCode true" for VSCode
# Run "nix-shell --arg allowUnfree true" to enable unfree extensions while still using VSCodium
# OR set - "useVsCode ? true,"  on line 9 to use VSCode as default and run "nix-shell" without --arg.
# Disable or enable entire extension packs by setting the corresponding flag to true or false.
# Add your preferred extensions to ../modules/user-extensions.nix
{
  allowUnfree ? false,
  useVsCode ? false,
  enableGitExtensions ? false,
  enableHtmlCssExtensions ? false,
  enableJsTsExtensions ? false,
  enableMarkdownExtensions ? false,
  enableUniversalExtensions ? false,
  enableUserExtensions ? true,
  enableDjangoExtensions ? false,
  enablePythonExtensions ? false,
  enableAngularExtensions ? false,
  enableNextjsExtensions ? false,
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
  universalExtensions = if enableUniversalExtensions then import ../modules/universal.nix { inherit pkgs; } else [];
  userExtensions = if enableUserExtensions then import ../modules/user-extensions.nix { inherit pkgs; } else [];
  pythonExtensions = if enablePythonExtensions then import ../modules/python.nix {inherit pkgs;} else [];
  djangoExtensions = if enableDjangoExtensions then import ../django/django.nix { inherit pkgs; } else [];
  angularExtensions = if enableAngularExtensions then import ../angular/angular.nix { inherit pkgs; } else [];
  nextjsExtensions =  if enableNextjsExtensions then import ../nextjs/nextjs.nix { inherit pkgs; } else [];
  allExtensions = gitExtensions ++ htmlCssExtensions ++ jsTsExtensions ++ markdownExtensions ++ universalExtensions ++ userExtensions ++ pythonExtensions ++ djangoExtensions ++ angularExtensions ++ nextjsExtensions;
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

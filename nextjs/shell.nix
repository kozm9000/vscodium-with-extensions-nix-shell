# Nix-shell configuration for Vscodium/VSCode with custom extensions for Next.js
# Run "nix-shell --arg useVsCode true" for VSCode
# Run "nix-shell --arg allowUnfree true" to enable unfree extensions while still using VSCodium
{
  allowUnfree ? false,
  useVsCode ? false,
}:
let
  # Configure package settings based on flags
  config = {
    allowUnfree = if useVsCode == true then true else (if allowUnfree == true then true else false);
  };
  # Import Nixpkgs with our configuration
  pkgs = import <nixpkgs> { inherit config; };
  # Define a custom VSCode derivation with extensions
  vscodeWithExtensions = pkgs.vscode-with-extensions.override {
    # Select VSCode (unfree) or Vscodium based on flags
    vscode = if useVsCode == true then pkgs.vscode else pkgs.vscodium;
    vscodeExtensions =
      with pkgs.vscode-extensions;
      [
        # Theme
        piousdeer.adwaita-theme
        # Docker and DB client
        ms-azuretools.vscode-containers
        cweijan.vscode-database-client2
        # Html and CSS intellisense
        ecmel.vscode-html-css
        bradlc.vscode-tailwindcss
        # Code Style & Linting
        esbenp.prettier-vscode
        yoavbls.pretty-ts-errors
        styled-components.vscode-styled-components
        wix.vscode-import-cost
        formulahendry.auto-close-tag
        formulahendry.auto-rename-tag
        aaron-bond.better-comments
        vincaslt.highlight-matching-tag
        oderwat.indent-rainbow
        mechatroner.rainbow-csv
        shardulm94.trailing-spaces
        # Markdown
        yzhang.markdown-all-in-one
        davidanson.vscode-markdownlint
        shd101wyy.markdown-preview-enhanced
        # Git & Version Control
        # mhutchie.git-graph
        codezombiech.gitignore
        eamodio.gitlens
        # Utilities
        usernamehw.errorlens
        mikestead.dotenv
        editorconfig.editorconfig
        christian-kohler.path-intellisense
        naumovs.color-highlight
        # AI
        continue.continue
      ]
      ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        # Code Style & Linting
        {
          name = "vscode-eslint";
          publisher = "dbaeumer";
          version = "3.0.19";
          sha256 = "sha256-rpYgvo5H1RBviV5L/pfDWqVXIYaZonRiqh4TLFGEODw=";
        }
        # Next.js & React
        {
          name = "vscode-nextjs-generator";
          publisher = "imgildev";
          version = "2.8.0";
          sha256 = "sha256-YjSmm7qUtNLSfD5x+qF7+eJzqANo0RvPuHMKePP36Ys=";
        }
        {
          name = "es7-react-js-snippets";
          publisher = "dsznajder";
          version = "4.4.3";
          sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
        }
        {
          name = "nextjs-snippets";
          publisher = "PulkitGangwar";
          version = "1.0.3";
          sha256 = "sha256-Yb1S+lqgWfzUTCXGbrT+qh9K7qRnuw2zJPi/VDrZV2Y=";
        }
        {
          name = "nextjs";
          publisher = "WillLuke";
          version = "0.0.8";
          sha256 = "sha256-369JXTuDcdnPBcJwRAc0mpBVunJD7VUjfjXZQ/nhrlw=";
        }
        # TypeScript & Imports
        {
          name = "tsimporter";
          publisher = "pmneo";
          version = "2.0.1";
          sha256 = "sha256-JQ7dAliryvVXH0Rg1uheSznOHqbp/BMwwlePH9P0kog=";
        }
        {
          name = "autoimport";
          publisher = "steoates";
          version = "1.5.4";
          sha256 = "sha256-7iIwJJsoNbtTopc+BQ+195aSCLqdNAaGtMoxShyhBWY=";
        }
        {
          name = "move-ts";
          publisher = "stringham";
          version = "1.12.0";
          sha256 = "sha256-qjqdyER2T40YwpiBOQw5/jzaFa3Ek01wLx6hb1TM3ac=";
        }
        {
          name = "json-to-ts";
          publisher = "MariusAlchimavicius";
          version = "1.8.0";
          sha256 = "sha256-WoSycVtUAkVXv7BDuh+jFbnaU1IdVLvVjOYuIuUp79M=";
        }
        # Git & Version Control
        {
          name = "vscode-conventional-commits";
          publisher = "vivaxy";
          version = "1.26.0";
          sha256 = "sha256-Lj2+rlrKm9h21zEoXwa2TeGFNKBmlQKr7MRX0zgngdg=";
        }
        # Utilities
        {
          name = "vscode-gutter-preview";
          publisher = "kisstkondoros";
          version = "0.32.2";
          sha256 = "sha256-JIr4UGuwy9Z5oH8D8elGMBGP8s40pYLCEZGmJAO5Ga0=";
        }
      ];
  };
in
pkgs.mkShellNoCC {
  # Build environment with custom VSCode setup
  packages = [
    vscodeWithExtensions
  ];
  # Automatically run vscodium ( or vscode ) when entering the shell.
  shellHook = if useVsCode == true then "code" else "codium";
}

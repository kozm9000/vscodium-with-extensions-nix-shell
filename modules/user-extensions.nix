{ pkgs }:
with pkgs.vscode-extensions;
[
  # Theme
  piousdeer.adwaita-theme
  # LLM tools
  continue.continue
  # Nix
  jnoortheen.nix-ide
]
# ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace []

{ pkgs }:
with pkgs.vscode-extensions;
[
  # You can safely delete these
  # Theme
  piousdeer.adwaita-theme
  # LLM tools
  continue.continue
  # Nix
  jnoortheen.nix-ide
  #arrterian.nix-env-selector
]
# ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace []
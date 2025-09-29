{ pkgs }:
with pkgs.vscode-extensions;
[
  # Theme
  piousdeer.adwaita-theme
  # LLM tools
  continue.continue
]
# ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace []

# Markdown extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  # Markdown
  yzhang.markdown-all-in-one
  davidanson.vscode-markdownlint
  shd101wyy.markdown-preview-enhanced
  # add from marketplace : mushan.vscode-paste-image
]
#++ pkgs.vscode-utils.extensionsFromVscodeMarketplace []
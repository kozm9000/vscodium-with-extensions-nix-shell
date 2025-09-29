# HTML/CSS related extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  ecmel.vscode-html-css
  formulahendry.auto-close-tag
  formulahendry.auto-rename-tag
  vincaslt.highlight-matching-tag
  # Tailwind
  bradlc.vscode-tailwindcss
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-css-peek";
    publisher = "pranaygp";
    version = "4.4.3";
    sha256 = "sha256-oY+mpDv2OTy5hFEk2DMNHi9epFm4Ay4qi0drCXPuYhU=";
  }
  {
    name = "vscode-css-navigation";
    publisher = "pucelle";
    version = "2.9.3";
    sha256 = "sha256-sX7ef+/BCbpVGo4ZOs8wnWRv2y5Ds+Pp8YlVxETmVr4=";
  }
]

# Angular extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  batisteo.vscode-django
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-djaneiro";
    publisher = "thebarkman";
    version = "1.4.2";
    sha256 = "sha256-vyrXdm2r7B9yWVZ39tnfi2zuw+LeMl1Pm6eOrh/haRI=";
  }
  {
    name = "django-factory";
    publisher = "Emeric-Defay";
    version = "0.0.9";
    sha256 = "sha256-XRn4CcFED9aP8x1cxwpgQhRNkVdDymJ0g3oJbUJJdTE=";
  }
  {
    name = "djlint";
    publisher = "monosans";
    version = "2025.9.0";
    sha256 = "sha256-19z+Y+EqrNFKCo1qXnKK7t89Xx8PrHenn3Ow2TzqO8M=";
  }
]

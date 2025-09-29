# Git & Version Control related extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  # mhutchie.git-graph - requires Unfree
  # gitlab.gitlab-workflow
  codezombiech.gitignore
  eamodio.gitlens
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-conventional-commits";
    publisher = "vivaxy";
    version = "1.26.0";
    sha256 = "sha256-Lj2+rlrKm9h21zEoXwa2TeGFNKBmlQKr7MRX0zgngdg=";
  }
]

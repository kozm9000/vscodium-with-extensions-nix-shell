# Markdown extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  njpwerner.autodocstring
  # Jinja
  # more downloads, but not updated - wholroyd.jinja
  samuelcolvin.jinjahtml
  charliermarsh.ruff
  ms-python.python
  ms-python.debugpy
  ms-python.mypy-type-checker
  # ms-python.vscode-pylance - Unfree
  # Disable charliermarsh.ruff and uncomment extensions below. Ruff is 10-100X faster though
  #ms-python.pylint
  #ms-python.flake8
  #ms-python.black-formatter
  #ms-python.isort
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vsc-python-indent";
    publisher = "KevinRose";
    version = "1.21.0";
    sha256 = "sha256-SvJhVG8sofzV0PebZG4IIORX3AcfmErDQ00tRF9fk/4=";
  }
]

# Javascript / Typescripr related extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  yoavbls.pretty-ts-errors
  styled-components.vscode-styled-components
  wix.vscode-import-cost
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-eslint";
    publisher = "dbaeumer";
    version = "3.0.19";
    sha256 = "sha256-rpYgvo5H1RBviV5L/pfDWqVXIYaZonRiqh4TLFGEODw=";
  }
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
]

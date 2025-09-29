# Angular extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  angular.ng-template
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "angular2";
    publisher = "johnpapa";
    version = "18.0.2";
    sha256 = "sha256-h/qmDHG5zzDh76e4yq+s0vjNBYXupPqV5V72opEQsIs=";
  }
  {
    name = "vscode-angular-generator";
    publisher = "imgildev";
    version = "2.18.2";
    sha256 = "sha256-iCOIY+jKAgsfmqnFmmzUN8PjMmGfgYFcl+mhS0uwENQ=";
  }
  {
    name = "rename-angular-component";
    publisher = "tomwhite007";
    version = "4.0.0";
    sha256 = "sha256-Lb4WgFloEygIQ5yGDghMZ+enwRyVp599lq7lZIPBWLs=";
  }
]

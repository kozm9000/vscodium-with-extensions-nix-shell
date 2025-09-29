{ pkgs }:
pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-nextjs-generator";
    publisher = "imgildev";
    version = "2.8.0";
    sha256 = "sha256-YjSmm7qUtNLSfD5x+qF7+eJzqANo0RvPuHMKePP36Ys=";
  }
  {
    name = "es7-react-js-snippets";
    publisher = "dsznajder";
    version = "4.4.3";
    sha256 = "sha256-QF950JhvVIathAygva3wwUOzBLjBm7HE3Sgcp7f20Pc=";
  }
  {
    name = "nextjs-snippets";
    publisher = "PulkitGangwar";
    version = "1.0.3";
    sha256 = "sha256-Yb1S+lqgWfzUTCXGbrT+qh9K7qRnuw2zJPi/VDrZV2Y=";
  }
  {
    name = "nextjs";
    publisher = "WillLuke";
    version = "0.0.8";
    sha256 = "sha256-369JXTuDcdnPBcJwRAc0mpBVunJD7VUjfjXZQ/nhrlw=";
  }
]

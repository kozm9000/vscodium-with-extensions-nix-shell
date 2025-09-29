# Universal extensions
{ pkgs }:
with pkgs.vscode-extensions;
[
  # Code Style & Linting
  esbenp.prettier-vscode
  aaron-bond.better-comments
  oderwat.indent-rainbow
  mechatroner.rainbow-csv
  shardulm94.trailing-spaces
  # Utilities
  streetsidesoftware.code-spell-checker
  usernamehw.errorlens
  mikestead.dotenv
  editorconfig.editorconfig
  christian-kohler.path-intellisense
  naumovs.color-highlight
  gruntfuggly.todo-tree
  # Docker, DB client
  ms-azuretools.vscode-containers
  cweijan.vscode-database-client2
  # ms-vscode-remote.remote-ssh - Unfree
  # Additional
  # humao.rest-client
  # johnpapa.vscode-peacock
  # ms-vscode.live-server
  # graphql.vscode-graphql
]
++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
  {
    name = "vscode-gutter-preview";
    publisher = "kisstkondoros";
    version = "0.32.2";
    sha256 = "sha256-JIr4UGuwy9Z5oH8D8elGMBGP8s40pYLCEZGmJAO5Ga0=";
  }
]

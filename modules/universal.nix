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
  redhat.vscode-yaml
  # Utilities
  streetsidesoftware.code-spell-checker
  usernamehw.errorlens
  mikestead.dotenv
  editorconfig.editorconfig
  christian-kohler.path-intellisense
  naumovs.color-highlight
  gruntfuggly.todo-tree
  # fill-labs.dependi - Unfree
  # Docker, DB client
  ms-azuretools.vscode-containers
  cweijan.vscode-database-client2
  # ms-vscode-remote.remote-containers - Requires MS VSCODE
  # ms-vscode-remote.remote-ssh - Requires MS VSCODE
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
  {
    name = "docker";
    publisher = "docker";
    version = "0.17.0";
    sha256 = "sha256-c1M5pC8JGm+IKQIviE163kYQOX8Nx0Gty7rV7OQCy88=";
  }
  {
    name = "emoji";
    publisher = "Perkovec";
    version = "1.0.1";
    sha256 = "sha256-vHKmXbeXKRyVqLuhvFagv9Q1WdHNL7a0q+rgOGOFi5o=";
  }
]

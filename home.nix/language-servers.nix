{ pkgs }: {
  home.packages = [
    pkgs.docker-compose-language-service
    pkgs.dockerfile-language-server-nodejs
    pkgs.idris2Packages.idris2Lsp
    pkgs.jdt-language-server
    pkgs.nim
    pkgs.terraform-ls
    pkgs.typescript-language-server
    pkgs.vscode-langservers-extracted
  ];
}

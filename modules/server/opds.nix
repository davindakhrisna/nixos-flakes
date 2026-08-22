# OPDS Server - Minimal Books
{
  config,
  ...
}: let
  booksDir = "${config.var.storageDirectory}/books";
in {
  virtualisation.docker.enable = true;

  virtualisation.oci-containers = {
    backend = "docker";
    containers.minimal-books = {
      image = "ghcr.io/davindakhrisna/minimal-books:latest";
      autoStart = true;
      ports = [
        "5000:5000"
      ];
      volumes = [
        "${booksDir}:/books"
        "/var/lib/minimal-books:/data"
      ];
      environment = {
        BOOKS_DIR = "/books";
        PORT = "5000";
      };
    };
  };
}

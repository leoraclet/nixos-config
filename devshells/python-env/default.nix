{pkgs, ...}:
pkgs.mkShell {
  packages = with pkgs; [
    python
    black
    mypy
  ];
}

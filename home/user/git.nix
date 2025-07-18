{
  programs.git = {
    enable = true;
    userName = "Léo Raclet";
    userEmail = "leo.raclet@gmail.com";
    extraConfig = {
      gpg.format = "ssh";
      init.defaultBranch = "main";
    }
  };
}

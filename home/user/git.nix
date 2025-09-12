{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Léo Raclet";
    userEmail = "leo.raclet@gmail.com";
    extraConfig = {
      gpg.format = "ssh";
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential."https://github.com".username = "leoraclet";
      credential.credentialStore = "cache";
      credential.cacheOptions = "--timeout 14400";
      pull.rebase = true;
      rerere.enabled = true;
    };
  };
}

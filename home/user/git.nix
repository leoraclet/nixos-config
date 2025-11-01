{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "N£utr0nys";
    userEmail = "110538448+leoraclet@users.noreply.github.com ";
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

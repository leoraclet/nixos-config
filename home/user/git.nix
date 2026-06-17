{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user = {
        email = "110538448+leoraclet@users.noreply.github.com";
        name = "N£utr0nys";
      };
      gpg.format = "ssh";
      init.defaultBranch = "main";
      credential.helper = "manager";
      credential."https://github.com".username = "leoraclet";
      credential.credentialStore = "cache";
      credential.cacheOptions = "--timeout 86400";
      pull.rebase = true;
      rerere.enabled = true;
    };
  };
}

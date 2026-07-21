{...}: {
  imports = [
    ./thunderbird.nix
  ];

  programs.mbsync.enable = true;
  programs.msmtp.enable = true;
  programs.notmuch = {
    enable = false;
    hooks = {
      preNew = "mbsync --all";
    };
  };
  accounts.email = {};
}

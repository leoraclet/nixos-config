{pkgs, ...}: {
  security.sudo = {
    enable = true;
    execWheelOnly = false;
    wheelNeedsPassword = false;
    extraRules = [
      {
        users = ["leonne"]; # apply this rule to this user
        # groups = [ "wheel" ]; # replace the line above with this line to apply the rule to groups
        # host = "ALL"; # host portion of ALL=(ALL:ALL) (i.e. the "ALL=" part), optional
        # runAs = "ALL:ALL"; # the "(ALL:ALL)" part in ALL=(ALL:ALL), optional

        commands = [
          {
            command = "ALL";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/systemctl suspend";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/reboot";
            options = ["NOPASSWD"];
          }
          {
            command = "${pkgs.systemd}/bin/poweroff";
            options = ["NOPASSWD"];
          }
        ];
      }
    ];
  };
}

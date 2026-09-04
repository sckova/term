# modules/ssh.nix
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    settings."*" = {
      AddKeysToAgent = "no";
      Compression = false;
      ControlMaster = "no";
      ControlPath = "~/.ssh/master-%r@%n:%p";
      ControlPersist = "no";
      ForwardAgent = false;
      HashKnownHosts = false;
      IdentityFile = "~/.ssh/key";
      ServerAliveCountMax = 3;
      ServerAliveInterval = 0;
      StrictHostKeyChecking = "no";
      UserKnownHostsFile = "~/.ssh/known_hosts";
    };
  };
}

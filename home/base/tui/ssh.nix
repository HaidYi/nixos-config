{
  programs.ssh = {
    enable = true;
    
    extraConfig = ''
      # a private key that is used during authentication will be added to ssh-agent if it is running
      AddkeysToAgent yes

      Host github
        HostName github.com
	User git
	IdentityFile ~/.ssh/github
	IdentitiesOnly yes
    '';
  };
}

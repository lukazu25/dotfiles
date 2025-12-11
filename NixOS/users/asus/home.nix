{ config, pkgs, ... }:

{
  home.username = "asus";
  home.homeDirectory = "/home/asus";
  home.stateVersion = "25.05";
  home-manager.backupFileExtension = "backup";

  home.packages = with pkgs; [
    # Your packages here
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      nrs = "sudo nixos-rebuild switch --flake /etc/nixos#nixos";
      hms = "home-manager switch --flake /etc/nixos#asus";
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";
    };

    initExtra = ''
      export PS1='\[\e[1;31m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[1;32m\]\w\[\e[0m\] \$ '
    '';
  };

  programs.git = {
    enable = true;
    userName = "asus";
    userEmail = "asus@example.com";
  };
}

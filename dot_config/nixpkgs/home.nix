{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "vince";
  home.homeDirectory = "/home/vince";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    anydesk
    appimage-run
    chezmoi
    chromium
    corefonts
    ferdium
    filezilla
    freecad
    gitflow
    jetbrains.idea-ultimate
    libheif
    libreoffice
    lutris
    neofetch
    nextcloud-client
    nixpkgs-review
    nmap
    nwg-launchers
    radeontop
    spotify
    sublime-merge
    super-slicer
    tor-browser-bundle-bin
    vlc
    vorta
  ];

  programs = {
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      extraConfig = "colorscheme gruvbox";
      plugins = with pkgs.vimPlugins; [
        vim-nix
        gruvbox
      ];
    };

    exa = {
      enable = true;
      enableAliases = true;
    };

    fish = {
      enable = true;
      shellInit = ''
        set fish_color_normal normal
        set fish_color_command white
        set fish_color_quote brgreen
        set fish_color_redirection brblue
        set fish_color_end white
        set fish_color_error -o brred
        set fish_color_param brpurple
        set fish_color_comment --italics brblack
        set fish_color_match cyan
        set fish_color_search_match --background=brblack
        set fish_color_operator cyan
        set fish_color_escape white
        set fish_color_autosuggestion brblack
      '';
      shellAliases = {
        nvim = "nvim -p";
        vim = "vim -p";
        rm = "rm -i";
        cp = "cp -i";
        mv = "mv -i";
        mkdir = "mkdir -p";
      };
      shellAbbrs = {
        hmbuild = "home-manager switch";
        hmconf = "vi $HOME/.config/nixpkgs/home.nix";
        nixbuild = "sudo nixos-rebuild switch";
        nixconf = "sudo vi /etc/nixos/configuration.nix";
        nixgarbage = "sudo nix-collect-garbage --delete-older-than 30d";
        nixsearch = "nix --extra-experimental-features 'nix-command flakes' search nixpkgs";
        sail = "./vendor/bin/sail";
      };
      functions = {
        ipfree = {
          description = "Check free ip addresses in a range";
          argumentNames = "hidden";
          body = "sudo nmap -v -sn -n $argv -oG - | awk '/Status: Down/{print $2}'";
        };
        nixclean = {
          description = "Clean unused packages and rebuild systemd-boot";
          argumentNames = "hidden";
          body = ''
            sudo nix-collect-garbage -d
            sudo nixos-rebuild switch
            sudo nixos-rebuild boot
          '';
        };
        nixupd = {
          description = "Update NixOS and Home-Manager";
          argumentNames = "hidden";
          body = ''
            sudo nix-channel --update
            sudo nixos-rebuild switch
            home-manager switch
          '';
        };
        fish_greeting = {
          description = "Greeting to show when starting a fish shell";
          body = "";
        };
      };
    };
  };
}

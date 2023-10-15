{ pkgs, username, ... }: {

  imports = [
    /etc/nixos/hardware-configuration.nix
    ./bootloader.nix
    ./hyprland.nix
    ./locale.nix
    ./nix.nix
    ./nvidia.nix
    ./audio.nix
  ];

  documentation.nixos.enable = true;

  virtualisation = {
    podman.enable = true;
    libvirtd.enable = true;
  };

  programs = {
    dconf.enable = true;
    zsh = {
	enable = true;
	enableCompletion = true;
	autosuggestions.enable = true;
	shellAliases = {
		vim = "nvim";
		update = "sudo nixos-rebuild switch -I nixos-config=/home/kevino/.config/nixos/configuration.nix";
	};
	ohMyZsh = {
		enable = true;
		plugins = ["git" "nvm"];
		theme = "robbyrussell";
	};
    };
    steam = {
    	enable = true;
	remotePlay.openFirewall = false;
	dedicatedServer.openFirewall = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim
    git
    wget
  ];

  services = {
    xserver.enable = true;
    xserver.excludePackages = [ pkgs.xterm ];
    printing.enable = true;
  };

  users.users.kevino = {
    isNormalUser = true;
    home = "/home/kevino";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "libvirtd"
    ];
    packages = with pkgs; [
	kitty
	google-chrome
	rofi
	neovim
	zsh
	oh-my-zsh
	htop
	neofetch
	tmux
	steam
	eww-wayland
	unzip
	xclip
	networkmanager
	socat
	jq
	acpi
	inotify-tools
	bluez
	pavucontrol
	brightnessctl
	playerctl
	gjs
	upower
	gtk3
	wl-gammactl
	wlsunset
	wl-clipboard
	hyprpicker
	blueberry
    ];
  };

  fonts.fonts = with pkgs; [
    nerdfonts
  ];

  system.stateVersion = "23.05";
}

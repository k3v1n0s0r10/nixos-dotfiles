{
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };
}

{ config, ... }:
{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {

    modesetting.enable = true;

    powerManagement = {
      enable = false;
      finegrained = false;
    };

    open = true;
    nvidiaSettings = false; # gui app
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };
}

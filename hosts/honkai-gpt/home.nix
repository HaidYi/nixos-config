{
  modules.desktop = {
    hyprland = {
      nvidia = false;
      settings = {
        # Configure your Display resolution, offset, scale and Monitors here, use `hyprctl monitors` to get the info.
        #   highres:      get the best possible resolution
        #   auto:         position automatically
        #   1.5:          scale to 1.5 times
        #   bitdepth,10:  enable 10 bit support
        monitor = "eDP-1,highres,auto,2";
      };
    };
  };

  programs.kitty.font.size = 10;
}

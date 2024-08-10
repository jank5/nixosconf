{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;

      font = {
        size = 16.5;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
        };
      };

      colors.primary.background = "#1d2021";
    };
  };
}

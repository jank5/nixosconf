{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.95;

      font = {
        normal.family = "JetBrains Mono";
        size = 17.5;
        bold = { style = "Bold"; };
      };

      window.padding = {
        x = 15;
        y = 15;
      };
      cursor.style = "Beam";
      colors = {
        primary = {
          background = "#112a2a";
          foreground = "#33ff33";
        };
        cursor = {
          text = "#112a2a";
          cursor = "#ff00ff";
        };
        vi_mode_cursor = {
          text = "#112a2a";
          cursor = "#ff00ff";
        };
        search = {
          matches = { foreground = "#000000" ; background = "#1AE642"; };
          focused_match = { foreground = "#000000" ; background = "#ff00ff"; };
        };
        hints = {
          start = { foreground = "#1d1f21" ; background = "#1AE642" ; };
          end = { foreground = "#1AE642"; background = "#1d1f21" ; };
        };
        line_indicator = {
          foreground = "#33ff33";
          background = "#1d1f21";
        };
        footer_bar = {
          foreground = "#33ff33";
          background = "#1d1f21";
        };
        selection = {
          text = "#112a2a";
          background = "#1AE642";
        };
        normal = {
          black   = "#000000";
          red     = "#f77272";
          green   = "#33ff33";
          yellow  = "#1AE642";
          blue    = "#68FDFE";
          magenta = "#ff66ff";
          cyan    = "#87CEFA";
          white   = "#dbdbd9";
        };
        bright = {
          black   = "#ffffff";
          red     = "#f77272";
          green   = "#33ff33";
          yellow  = "#1AE642";
          blue    = "#68FDFE";
          magenta = "#ff66ff";
          cyan    = "#68FDFE";
          white   = "#dbdbd9";
        };
      };
    };
  };

}

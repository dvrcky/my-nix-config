{
  programs.alacritty = {
    enable = true;
    settings = {
      window.opacity = 0.85;

      font = {
        size = 13.0;
        draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrains Mono";
        };
      };

      colors.primary.background = "#000000";
    };
  };
}

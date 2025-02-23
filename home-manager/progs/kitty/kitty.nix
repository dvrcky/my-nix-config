{
  programs.kitty = {
    enable = true;
    font.name = "Iosevka Nerd Font";
    font.size = 12;

    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
    };

    extraConfig = "
      # vim:ft=kitty

## name:     Catppuccin Kitty Diff Mocha
## author:   Catppuccin Org
## license:  MIT
## upstream: https://github.com/catppuccin/kitty/blob/main/themes/diff-mocha.conf
## blurb:    Soothing pastel theme for the high-spirited!

# text
foreground           #cdd6f4
# base
background           #1e1e2e
# subtext0
title_fg             #a6adc8

# mantle
title_bg             #181825
margin_bg            #181825

# subtext1
margin_fg            #a6adc8
# mantle
filler_bg            #181825

# 30% red, 70% base
removed_bg           #5e3f53
# 50% red, 50% base
highlight_removed_bg #89556b
# 40% red, 60% base
removed_margin_bg    #734a5f

# 30% green, 70% base
added_bg             #475a51
# 50% green, 50% base
highlight_added_bg   #628168
# 40% green, 60% base
added_margin_bg      #734a5f

# mantle
hunk_margin_bg       #181825
hunk_bg              #181825

# 40% yellow, 60% base
search_bg            #766c62
# text
search_fg            #cdd6f4
# 30% sky, 70% base
select_bg            #3e5767
# text
select_fg            #cdd6f4


      ";
  };
}

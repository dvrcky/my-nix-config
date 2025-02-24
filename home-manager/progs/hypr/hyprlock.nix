{
  programs.hyprlock.enable = true;
  programs.hyprlock.extraConfig = "
background {
    monitor = eDP-1
    path = /home/dvrcky/Downloads/back.png
    blur_passes = 1
		blur_size = 2
    contrast = 0.8916
    brightness = 0.5172
    vibrancy = 0.1696
    vibrancy_darkness = 0.0
}

general {
    no_fade_in = false
    grace = 0
    disable_loading_bar = false
}

label {
    monitor = eDP-1
    text = cmd[update:1000] echo \"<span>$(date +\"%I\")</span>\"
    color = rgba(255, 255, 255, 1)
    font_size = 110
    font_family = JetBrains Mono
    position = -80, 250
    halign = center
    valign = center
}

label {
    monitor = eDP-1
    text = cmd[update:1000] echo \"<span>$(date +\"%M\")</span>\"
    color = rgba(147, 196, 255, 1)
    font_size = 110
    font_family = JetBrains Mono
    position = 30, 140
    halign = center
    valign = center
}

label {
    monitor = eDP-1
    text = cmd[update:1000] echo -e \"$(date +\"%d %B, %a.\")\"
    color = rgba(255, 255, 255, 100)
    font_size = 16
    font_family = eDP-1
    position = 20, 75
    halign = center
    valign = center
}

label {
    monitor = eDP-1
    text =     $USER
    color = rgba(216, 222, 233, 0.80)
    outline_thickness = 2
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    font_size = 18
    font_family = JetBrains Mono
    position = 0, -170
    halign = center
    valign = center
}

input-field {
    monitor = eDP-1
    size = 230, 38
    outline_thickness = 2
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = rgba(0, 0, 0, 0)
    inner_color = rgba(255, 255, 255, 0.1)
    font_color = rgb(200, 200, 200)
    fade_on_empty = false
    font_family = JetBrains Mono
    placeholder_text = <i><span foreground=\"##ffffff99\">🔒 Enter Pass</span></i>
    hide_input = false
    position = 0, -215
    halign = center
    valign = center
}
  ";
}

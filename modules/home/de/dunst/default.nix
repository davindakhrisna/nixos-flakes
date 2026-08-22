{
  config,
  pkgs,
  ...
}: let
  c = config.lib.stylix.colors;
  font = config.stylix.fonts.sansSerif.name;
  fontSize = config.stylix.fonts.sizes.popups;
  rounding = config.theme.rounding;
  borderSize = config.theme.border-size;
  gapsOut = config.theme.gaps-out;
  gapsIn = config.theme.gaps-in;
in {
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 360;
        height = 300;
        origin = "top-right";
        offset = "${toString (gapsOut * 2)}x${toString (gapsOut * 2)}";
        notification_limit = 5;

        # Progress bar
        progress_bar = true;
        progress_bar_height = 4;
        progress_bar_frame_width = 0;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        progress_bar_corner_radius = rounding;

        # Geometry & Display
        frame_width = borderSize;
        frame_color = "#${c.base0D}";
        corner_radius = rounding;
        gap_size = gapsIn;
        padding = 12;
        horizontal_padding = 16;
        text_icon_padding = 12;

        # Font & Text
        font = "${font} ${toString fontSize}";
        format = "<b>%s</b>\\n%b";
        markup = "full";
        alignment = "left";
        show_age_threshold = 60;
        word_wrap = true;
        ellipsize = "middle";
        ignore_newline = false;
        stack_duplicates = true;
        hide_duplicate_count = false;

        # Icons
        icon_position = "left";
        min_icon_size = 32;
        max_icon_size = 48;
        icon_theme = "Papirus-Dark";

        # Behavior
        follow = "mouse";
        show_indicators = true;
        mouse_left_click = "close_current";
        mouse_middle_click = "do_action, close_current";
        mouse_right_click = "close_all";
      };

      urgency_low = {
        background = "#${c.base00}";
        foreground = "#${c.base05}";
        frame_color = "#${c.base03}";
        timeout = 3;
      };

      urgency_normal = {
        background = "#${c.base00}";
        foreground = "#${c.base05}";
        frame_color = "#${c.base0D}";
        timeout = 5;
      };

      urgency_critical = {
        background = "#${c.base00}";
        foreground = "#${c.base08}";
        frame_color = "#${c.base08}";
        timeout = 0;
      };
    };
  };

  stylix.targets.dunst.enable = false;
}

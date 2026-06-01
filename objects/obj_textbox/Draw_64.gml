draw_sprite_ext(text_sprite, 0, x, y, width, height, 0, #ffffff, 1);

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_colour(text_color);
scr_typing(x + text_x, y + text_y, text, text_progress, text_width);
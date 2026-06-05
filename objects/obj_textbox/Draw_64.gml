draw_sprite_stretched(text_sprite, 0, x, y, width, height);


draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
scr_type(x + text_x, y + text_y, text, text_progress, text_width);
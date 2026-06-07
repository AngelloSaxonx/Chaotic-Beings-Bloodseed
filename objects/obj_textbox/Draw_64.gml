draw_sprite_stretched(text_sprite, 0, x, y, width, height);

var _draw_text_x = x;
var _draw_text_y = y;
var _draw_text_width = text_width;

var _finished = (text_progress == text_length);

if (sprite_exists(portrait_sprite))
{
	_draw_text_width -= portrait_width + portrait_x + padding;
	
	var _draw_portrait_x = x + portrait_x;
	var _draw_portrait_y = y + portrait_y;
	var _draw_portrait_xscale = 1;
	
	if (portrait_side == PORTRAIT_SIDE.LEFT)
	{
		
	}
	
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(text_font);
draw_set_color(text_color);
scr_type(_draw_text_x + text_x, _draw_text_y + text_y, text, text_progress, _draw_text_width);
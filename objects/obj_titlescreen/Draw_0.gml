draw_set_font(global.classic_font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);
for (var i = 0; i < option_lenght; i++)
{
	draw_text(x+option_border, y+option_border + option_space*i, option[i]);
}


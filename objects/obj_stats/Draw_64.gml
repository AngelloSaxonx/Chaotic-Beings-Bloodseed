//draw
if room != rm_titlescreen
{
	for (var i = 0; i < hp_max; ++i) {
	    // code here
		if (hp >= i+1)
		{
		draw_sprite(hp_spr,0,Xoffset * space + (i*space), Yoffset)
		}
		else
		{
		draw_sprite(hp_max_spr,0,Xoffset * space + (i*space), Yoffset)
		}
	}
	draw_sprite(char_spr,0,Xoffset * space, Yoffset)
}
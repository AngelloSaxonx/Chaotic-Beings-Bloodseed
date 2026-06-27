//draw
if room != rm_titlescreen
{
	for (var i = 0; i < heart_max; ++i) {
	    // code here
		if (heart >= i+1)
		{
		draw_sprite(heart_spr,0,Xoffset * space + (i*space), Yoffset)
		}
		else
		{
		draw_sprite(heart_max_spr,0,Xoffset * space + (i*space), Yoffset)
		}
	}
}
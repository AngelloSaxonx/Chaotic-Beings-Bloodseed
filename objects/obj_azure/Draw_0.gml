if (abs(xspd != 0)) && (from != noone) && (state != scr_state_dash) && (state != scr_wall_recovery)
{
	image_moving += sprite_get_speed(attack_spr)/60
	draw_sprite_part_ext(sprite_index, image_index,0,34,40,6,x-(20*face),y-6,image_xscale*face, image_yscale, image_blend, image_alpha)
	draw_sprite_part_ext(attack_spr, image_moving,0,0,40,34,x-(20*face),y-40,image_xscale*face, image_yscale, image_blend, image_alpha)
}
else
{
	image_moving = 0;
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale*face, image_yscale, image_angle, image_blend, image_alpha)
}
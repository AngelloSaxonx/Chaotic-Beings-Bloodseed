test_text = 0;
scr_contol_setup()

mask_spr = spr_azure;
idle_spr = spr_azure;
walk_spr = spr_azure_walk;
run_spr = spr_azure_run;

jump_spr = spr_azure_jump;
dash_air_spr = spr_azure_dash_air;
dash_down_spr = spr_azure_dash_down;
swim_spr = spr_azure_swim;

face = 1;

run_type = 0;
move_dir = 0;
move_spd[0] = 2
move_spd[1] = 3;
xspd = 0;
yspd = 0;

grav = .275;
term_vel = 4;
on_ground = true;
on_water = false
in_transition = false

can_jump = true // in case
jump_max = 2;
jump_count = 0;
jump_hold_timer = 0;
jump_hold_frames[0] = 16;

jspd[0] = -(3)*2; //Double the jump
jump_hold_frames[1] = 12;
jspd[1] = -(5)*2; //This too

can_dash = true;
dash_distance = 40;
dash_time = 10;

fast_step = true;
double_jump = true;

scr_state_idle = function()
{
    move_dir = right_key - left_key;

    if move_dir != 0 {face = move_dir};

    run_type = run_key;
    
 if (move_dir != 0){
        xspd = move_dir * move_spd[run_type];
    } else /* if (on_ground == true)*/{
        xspd *= .98;
       if (xspd < 0.05) or (xspd > 0.05) xspd = 0;
    }

    if can_dash && dash_key
    {
        can_dash = false
		if on_ground
		{
        dash_spd = dash_distance/dash_time;
        dash_energy = dash_time;
        xspd = face * dash_spd;
		}
        if !on_ground
        {
		dash_spd = dash_distance/dash_time;
        dash_energy = dash_time;
        xspd = face * dash_spd;
			if down_key
			{
				yspd = dash_spd + 10
				xspd = 0
				dash_energy = dash_time
			}
        }
        
    state = scr_state_dash;
    }
    
    if yspd >= 0 && !place_meeting(x + xspd, y + 1, obj_collision)
    {
    
    }
	
	if on_water = true
	{
		state = scr_state_swim;
	}

    scr_state_jump()
    scr_movement();

if on_ground
    //Idle
{image_speed = 1
	if abs(xspd) == 0 
    {if sprite_index != idle_spr
        {image_index = 0}
    sprite_index = idle_spr}
//Run & Dash
else if abs(xspd) >= move_spd[1] 
    {
//<<<<<<< Updated upstream
			
		if sprite_index != run_spr
//=======
		//Dash
		if (dash_energy > 0){
		if sprite_index != dash_air_spr
//>>>>>>> Stashed changes
        {image_index = 0}
		sprite_index = dash_air_spr;
		}//Run
		else{
		if sprite_index != run_spr
        {image_index = 0}
		sprite_index = run_spr;
		}
	}
//Walk
else 
    {if sprite_index != walk_spr
        {image_index = 0}
    sprite_index = walk_spr};
}
//Jump
else //if (!on_ground) || (jump_key)
{    
//Airdash
	image_speed = 1
	if abs(xspd) >= move_spd[1] 
	    {if sprite_index != dash_air_spr 
	        {image_index = 0}
	    sprite_index = dash_air_spr;}
	//Downdash
	else if yspd = (dash_distance/dash_time) + 10
		{if sprite_index != dash_down_spr
			{image_index = 0}
		sprite_index = dash_down_spr;}
	//Jump
	else if sprite_index != dash_air_spr || sprite_index != dash_down_spr
	    {
			if sprite_index != jump_spr
	        {
				if (jump_key) {image_index = 0} // if you press jump
				else {image_index = 1} // Otherwise act like falling
			}
			else
			{
				if (jump_key_pressed && can_jump) {image_index = 0} //Double jumping refresh animation
			}
			sprite_index = jump_spr
		}
}

};

scr_state_dash = function()
    {
    if (dash_energy-- <= 0 || xspd == 0)
    {
        state = scr_state_idle;
        can_dash = true;
    }
    else
    {
    scr_movement(false,false);
    }
}

scr_state_swim = function()
{
	//X
	move_dir = right_key - left_key;

    if move_dir != 0 {face = move_dir};

    run_type = run_key;
    
	if (move_dir != 0){
        xspd = move_dir * move_spd[run_type] / 2; // because you're on water
    } else {
        xspd *= .98;
       if (xspd < 0.05) or (xspd > 0.05) xspd = 0;
    }
	
    //The variables setup
    var _ins = instance_place( x, y, obj_swim)
    var _at_surface = false;
    //If there's water nearby
    if instance_exists(_ins)
    {
        var _yy = _ins.bbox_top+8 //_ins.y+sprite_height/2
        if (y > _yy){y = _yy};

        //If you go to water
        if y+yspd <= _ins.y
        {
            yspd -= grav*2;
            //If you jump out the water
            if y+yspd <= _ins.y
            {
                y = _ins.y;
                yspd = 0;
                _at_surface = true;
				if (on_water = false) // reseting state
				{
					state = scr_state_idle
				}
            }
        }
    }
	//Y
	if (jump_key_pressed && can_jump) {sprite_index = jump_spr; image_index = 0;} //Double jumping refresh animation
	scr_state_jump()
	//Movement
    scr_movement(!_at_surface)
	
	if abs(xspd) == 0 
	{image_speed = 0; image_index = 0;}
	else{image_speed = 1;}
	sprite_index = swim_spr
}

state = scr_state_idle;
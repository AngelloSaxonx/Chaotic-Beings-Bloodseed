// Checking Y Ground
#region
var list = ds_list_create()
var nearest = noone
var dist = 9999999;
var coll = collision_rectangle_list(bbox_left,y,bbox_right,room_height,obj_collision,false,true,list,true)
if (coll > 0)
{
	for (var d = 0; d < coll; d++) {
		var inst = list[| d];
		var dist2 = point_distance(x, y, inst.x, inst.y);

		if (dist2 < dist)
		{
			dist = dist2;
			nearest = inst;
		}
	}
	ds_list_destroy(list);
}

if (nearest != noone)
{
	y_ground = nearest.bbox_top
}
else
{
	y_ground = room_height
}
#endregion

//Pathing
#region
if (mp_grid_path(Obj_grid.cell,path,x,y,TargetX,TargetY-1,true))
{
	path_start(path,3,path_action_stop,true)
	path_end()
	var _xx = path_get_point_x(path,1)
	var _yy = path_get_point_y(path,1)
	
	if (x-1 < _xx-1)
	{
		xspd = 1
	}
	else if (x-1 > _xx+1)
	{
		xspd = -1
	}
	else
	{
		xspd = 0
	}
	
	if (y < _yy-10)
	{
		//yspd = 1
		if !collision_rectangle(bbox_left,bbox_top-jump_range,bbox_right,bbox_top,obj_collision,false,true) 
		&& (collision_rectangle(bbox_left+(pit_check_range*xspd),bbox_top,bbox_right+(pit_check_range*xspd),bbox_bottom+(pit_check_depth+(pit_check_depth/2)),obj_collision,false,true))
		{should_jump = 1;} else {should_jump = 0}
	}
	else if (y > _yy+10)
	{
		//yspd = -1
		if (collision_rectangle(x,y-1,x+(xspd*pit_check_range),y-120,obj_collision,false,true) 
		|| (!collision_rectangle(bbox_left+(pit_check_range*xspd),bbox_top,bbox_right+(pit_check_range*xspd),bbox_bottom+pit_check_depth,obj_collision,false,true)))
		{should_jump = 1;} else {should_jump = 0;}
	}
	else
	{
		//yspd = 0
		//if collision_line(x,y-1,x+(xspd*100),y-1,obj_collision,false,true)
		
		if (!collision_rectangle(bbox_left+(pit_check_range*xspd),bbox_top,bbox_right+(pit_check_range*xspd),bbox_bottom+pit_check_depth,obj_collision,false,true)) && (obj_azure.y <= y_ground)
		{should_jump = 1;} else {should_jump = 0;}
	}
}
#endregion

//Finding
#region
if (collision_rectangle(x-room_width,y_ground-detect_range,x+room_width,y_ground,obj_azure,false,true)
&& !collision_line(x,bbox_top,obj_azure.x,obj_azure.y-(obj_azure.sprite_height/2),obj_collision,false,true))
|| (obj_azure.y > y_ground)
{
	TargetX = obj_azure.x
	TargetY = obj_azure.y
}
else
{
var inst = instance_place(x,y+5,obj_collision)
if (inst)
{
	if (inst.nearest != noone) && (inst.RPoint - inst.nearest.LPoint < jump_range) 
	{
		TargetX = inst.nearest.RPoint
		TargetY = inst.nearest.YPoint
	}
	else
	{
		if (!collision_rectangle(bbox_left-(pit_check_range*xspd),bbox_top,bbox_right-(pit_check_range*xspd),bbox_top-120,obj_collision,false,true))
		{
		TargetX = obj_azure.x
		TargetY = obj_azure.y
		}
		else
		{
		TargetX = inst.RPoint
		TargetY = inst.YPoint
		}
	}
}
}
#endregion

//Movement
#region
if !place_meeting(x,y+1,obj_collision)
{
	yspd += grav
}
var coll1 = collision_rectangle(bbox_left,bbox_top+yspd-(1-should_jump),bbox_right,bbox_bottom+yspd+(1-should_jump),obj_collision,false,true)
if (coll1)
{
	yspd = 0;
}

if (should_jump == 1) && place_meeting(x,y+1,obj_collision)
{
	yspd = -12
}

if place_meeting(x+xspd,y,obj_collision)
{
	xspd = 0;
}

x += xspd*spd
y += yspd
#endregion

depth = 300;
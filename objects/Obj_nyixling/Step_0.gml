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
	var fall_down_value = 1;
	if (obj_azure.y-1 > y_ground)
	{fall_down_value = 2}
	var _xx = path_get_point_x(path,fall_down_value)
	var _yy = path_get_point_y(path,fall_down_value)
	
	if (x < _xx-1)
	{
		xspd = 1
	}
	else if (x > _xx+1)
	{
		xspd = -1
	}
	else
	{
		xspd = 0
	}
	
	if (!collision_circle(x,y,15,obj_azure,false,true))
	{
		if (y < _yy-10)    // fall
		{
			var coll2 = collision_rectangle(x,bbox_bottom,x+((xspd*fall_range)*spd),bbox_bottom+(fall_range*spd),obj_collision,false,true)
			var coll3 = instance_place(x,y+5,obj_collision)
			if (coll2 != noone && coll3 != noone && coll2.id != coll3.id)
			{should_jump = 1;} else {should_jump = 0}
		}
		else if (y > _yy+10)  // jump
		{
			if collision_rectangle(x,bbox_top,x+(xspd*jump_range),bbox_bottom,obj_collision,false,true) ||
			(!collision_rectangle(x+(xspd*30),bbox_bottom,x+(xspd*30)+(xspd*pit_check_range),bbox_bottom+pit_check_depth,obj_collision,false,true))
			{should_jump = 1;} else {should_jump = 0;}
		}
		else
		{
			if (!collision_rectangle(x,bbox_bottom,x+(xspd*pit_check_range),bbox_bottom+pit_check_depth,obj_collision,false,true)) && (obj_azure.y-1 <= y_ground)
			{should_jump = 1;} else {should_jump = 0;}
		}
	}
	else
	{
		should_jump = 0;
	}
}
#endregion

//Finding
#region

if (collision_rectangle(x-room_width,y_ground-detect_range,x+room_width,y_ground,obj_azure,false,true)
&& place_meeting(x,y+5,obj_collision)
)
|| (obj_azure.y >= y_ground)
{
	TargetX = obj_azure.x
	TargetY = obj_azure.y
}
else
{
var inst = instance_place(x,y+5,obj_collision)
if (inst)
{
	//Checking Left
	if (xspd == 1)
	{
		if (inst.nearest != noone) && (inst.RPoint - inst.nearest.LPoint < jump_range) 
		{
			TargetX = inst.nearest.LPoint
			TargetY = inst.nearest.YPoint
		}
		else
		{
			TargetX = inst.LPoint
			TargetY = inst.YPoint
		}
	}
	//Checking Right
	else if (xspd == -1)
	{
		if (inst.nearest2 != noone) && (inst.LPoint - inst.nearest.RPoint < jump_range) 
		{
			TargetX = inst.nearest2.RPoint
			TargetY = inst.nearest2.YPoint
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
	if (can_jump == 0)
	{
	can_jump = 1;
	}
}

if (should_jump == 1) && (can_jump == 1) && place_meeting(x,y+5,obj_collision)
{
	yspd = -jspd
	can_jump = 0;
}

if place_meeting(x+(xspd*spd),y,obj_collision)
{
	xspd = 0;
}

x += xspd*spd
y += yspd
#endregion

depth = 300;
if collision_circle(x,y_ground,detect_range,Target,false,true)
{
destinationX = Target.x
destinationY = Target.y
}
else
{
if (time_rerun = 1) {time_rerun = 0; alarm[0] = 300}
}

// Checking Y Ground
#region
var list = ds_list_create()
var nearesty = noone
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
			nearesty = inst;
		}
	}
	ds_list_destroy(list);
}

if (nearesty != noone)
{
	y_ground = nearesty.bbox_top
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
	if (TargetY-1 > y_ground)
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
	
	if (point_distance(x,y,destinationX,destinationY) > 15)
	{
		if (y < _yy-10)    // fall
		{
			var coll2 = collision_rectangle(x,bbox_bottom,x+min((xspd*fall_range)*spd,TargetX-x),bbox_bottom+min(fall_range*spd,(TargetY-1+pit_check_depth)-y),obj_collision,false,true)
			var coll3 = instance_place(x,y+5,obj_collision)
			if (coll2 != noone && coll3 != noone && coll2.id != coll3.id)
			{should_jump = 1;} else {should_jump = 0}
		}
		else if (y > _yy+10)  // jump
		{
			if collision_rectangle(x,bbox_top,x+(xspd*jump_range),bbox_bottom,obj_collision,false,true) ||
			(!collision_rectangle(x+(xspd*pit_check_range),bbox_bottom,x+((xspd*pit_check_range)*2),bbox_bottom+pit_check_depth,obj_collision,false,true))
			{should_jump = 1;} else {
				should_jump = 0;
				}
		}
		else
		{
			if ((xspd == 1 && (!collision_rectangle(x,bbox_bottom,x+pit_check_range,bbox_bottom+pit_check_depth,obj_collision,false,true)))
			|| (xspd == -1 && (!collision_rectangle(x-pit_check_range,bbox_bottom,x,bbox_bottom+pit_check_depth,obj_collision,false,true))))
			&& (TargetY-1 <= y_ground)
			{should_jump = 1;} else { should_jump = 0;}
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

if ((point_in_rectangle(destinationX,destinationY,x-room_width,y_ground-detect_range,x+room_width,y_ground)
&& place_meeting(x,y+5,obj_collision))
|| (destinationY-1 >= y_ground-1))
{
	TargetX = destinationX
	TargetY = destinationY
}
else
{
	var inst = instance_place(x,y+5,obj_collision)
	if (inst)
	{
		if (point_distance(x,y,destinationX,destinationY) > 15)
		{
		//Checking Left
		if (xspd == 1) //&& ((inst.nearest != noone) && (inst.nearest.YPoint-jump_range < destinationY))
		{
			if (inst.nearest != noone) && (inst.RPoint - inst.nearest.LPoint < jump_range)
			{
				TargetX = inst.nearest.LPoint
				TargetY = inst.nearest.YPoint
			}
			else
			{
				TargetX = inst.x//LPoint
				TargetY = inst.bbox_top//YPoint
			}
		}
		else
		{
			xspd = -1
		}
		//Checking Right
		if (xspd == -1) //&& ((inst.nearest2 != noone) && (inst.nearest2.YPoint-jump_range < destinationY))
		{
			if (inst.nearest2 != noone) && (inst.LPoint - inst.nearest2.RPoint < jump_range) 
			{
				TargetX = inst.nearest2.RPoint
				TargetY = inst.nearest2.YPoint
			}
			else
			{
				TargetX = inst.x//RPoint
				TargetY = inst.bbox_top//YPoint
			}
		}
		else
		{
			xspd = 1
		}
		}
		else
		{
			xspd = 0;
		}
	}
}

#endregion

//Movement
#region
if !place_meeting(x,y+2,obj_collision)
{yspd += grav}

var coll1 = collision_rectangle(bbox_left,bbox_top+yspd+(1-should_jump),bbox_right,bbox_bottom+yspd+(1-should_jump),obj_collision,false,true)
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
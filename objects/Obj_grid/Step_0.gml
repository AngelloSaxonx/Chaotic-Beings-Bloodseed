with (obj_crimson_ceilling_tent)
{
	mp_grid_clear_rectangle(Obj_grid.cell,bbox_left,bbox_top+80,bbox_right,bbox_bottom-40)
	mp_grid_clear_rectangle(Obj_grid.cell,x-20,bbox_top+100,x+10,bbox_bottom-100)
}

with (obj_crimson_arena)
{
	mp_grid_clear_rectangle(Obj_grid.cell,bbox_left,bbox_top+60,bbox_right,bbox_bottom-60)
}

with (obj_crimson_floor_tent)
{
	mp_grid_clear_rectangle(Obj_grid.cell,bbox_left,bbox_top+60,bbox_right,bbox_bottom-60)
	mp_grid_clear_rectangle(Obj_grid.cell,x-20,bbox_top+80,x+10,bbox_bottom-120)
}
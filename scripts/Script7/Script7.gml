function path_invalid(Obj){

if (Obj.sprite_index == spr_crimson_arena_collision &&
point_in_rectangle(destinationX,destinationY,Obj.bbox_left+40,Obj.bbox_top+20,Obj.bbox_left+120,Obj.bbox_top+40))


{
	invaild_pathing = true
}

}
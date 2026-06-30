var _layer = layer_get_id_at_depth(-999)[0];
if(_layer == -1) _layer[0] = layer_create(-900);
if(_layer != -1) _layer[1] = layer_create(300);

layer_sprite_create(_layer[0], x, y, spr_crimson_tent_1);

// if noone, then make new, else just overwrite the array with the top layer
if(layer[0] == -1) layer = layer_create(-9999) else layer = layer[0];

mask_index = spr_crimson_tent_1_collision

var coll = instance_create_depth(x,y,depth-1,obj_collision)
coll.sprite_index = spr_crimson_tent_1_collision
coll.mask_index = spr_crimson_tent_1_collision
coll.LPoint = bbox_left+10
coll.RPoint = bbox_right-10

coll.yvalue = bbox_top+40-10
coll.yvalue2 = bbox_bottom-(40-10)

coll.grabableTop = coll.yvalue+10
coll.grabableBot = coll.yvalue2+30
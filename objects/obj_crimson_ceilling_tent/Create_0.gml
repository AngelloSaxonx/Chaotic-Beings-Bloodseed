event_inherited();
LPoint = bbox_left+10
RPoint = bbox_right-10

YPoint = bbox_bottom-30
grabableTop = bbox_top + 60
grabableBot = bbox_bottom - 20

var _layer = layer_get_id_at_depth(-999)[0];
if(_layer == -1) _layer[0] = layer_create(-999);
if(_layer != -1) _layer[1] = layer_create(300);

layer_sprite_create(_layer[0], x, y, spr_crimson_ceilling_tent_front);

// if noone, then make new, else just overwrite the array with the top layer
if(layer[0] == -1) layer = layer_create(-9999) else layer = layer[0];

mask_index = spr_crimson_ceilling_tent_wall

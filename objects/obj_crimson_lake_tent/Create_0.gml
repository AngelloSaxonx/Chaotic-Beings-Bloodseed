event_inherited()
var _layer = layer_get_id_at_depth(-999)[0];
if(_layer == -1) _layer[0] = layer_create(-999);
if(_layer != -1) _layer[1] = layer_create(300);

layer_sprite_create(_layer[0], x, y, spr_crimson_lake_tent_front);
layer_sprite_create(_layer[1], x, y, spr_crimson_lake_tent_back);

// if noone, then make new, else just overwrite the array with the top layer
if(layer[0] == -1) layer = layer_create(-9999) else layer = layer[0];

mask_index = spr_crimson_lake_tent_wall
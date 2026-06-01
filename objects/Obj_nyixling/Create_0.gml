y = y-1
idle_spr = spr_nyixling;
TargetX = obj_azure.x
TargetY = obj_azure.y
path = path_add()
xspd = 0;
yspd = 0;
grav = .275;
spd = 2
jspd = 8//12
should_jump = 0;
y_ground = room_height

pit_check_depth = 20
pit_check_range = pit_check_depth+(pit_check_depth/2)
jump_range = 120 // jspd * 15
fall_range = 100 // spd * 50
detect_range = 120 // jump_range

can_jump = 1
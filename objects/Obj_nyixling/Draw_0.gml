draw_self()

draw_path(path,x,y,true)

draw_rectangle(x,bbox_bottom,x+min((xspd*fall_range)*spd,TargetX-x),bbox_bottom+min(fall_range*spd,(TargetY+19)-y),true)
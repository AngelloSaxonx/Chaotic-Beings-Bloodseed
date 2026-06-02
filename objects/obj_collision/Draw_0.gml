draw_self()

if (nearest != noone)
{
draw_line(nearest.LPoint, nearest.YPoint, RPoint, YPoint)
}
draw_set_colour(c_red)
if (nearest2 != noone)
{
draw_line(nearest2.RPoint, nearest2.YPoint-3, LPoint, YPoint-3)
}
draw_set_colour(c_white)
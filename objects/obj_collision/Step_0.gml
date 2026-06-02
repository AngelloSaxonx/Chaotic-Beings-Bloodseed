//Syncing

with (obj_collision)
{
    // ignore itself
    
    if (id != other.id)
    {
	    var dis = point_distance(other.RPoint, other.YPoint, LPoint, YPoint);

	    // must be close enough
	    if (dis <= other.max_dist) && (other.YPoint >= YPoint)
	    {
	        // nearest valid wall
	        if (dis < other.dist)
	        {
	            other.dist = dis;
	            other.nearest = id;
	        }
	    }
		
		var dis2 = point_distance(other.LPoint, other.YPoint, RPoint, YPoint);

	    // must be close enough
	    if (dis2 <= other.max_dist) && (other.YPoint >= YPoint)
	    {
	        // nearest valid wall
	        if (dis2 < other.dist2)
	        {
	            other.dist2 = dis2;
	            other.nearest2 = id;
	        }
	    }
		
	}
}

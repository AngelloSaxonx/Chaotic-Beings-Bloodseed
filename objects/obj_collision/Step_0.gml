//Syncing

with (obj_collision)
{
    // ignore itself
    if (id != other.id)
    {

        var dist = point_distance(other.RPoint, other.YPoint, LPoint, YPoint);

        // must be close enough
        if (dist <= other.max_dist)
        {
            // nearest valid wall
            if (dist < other.dist)
            {
                other.dist = dist;
                other.nearest = id;
            }
        }
    }
}

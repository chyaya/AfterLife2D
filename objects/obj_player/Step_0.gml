//Stop path if we are close enough
if(path != undefined)
{
    if(point_distance(x, y, position_get_x(endPosition), position_get_y(endPosition)) <= pathSpeed)
    {
        x = position_get_x(endPosition);
        y = position_get_y(endPosition);
        path_end();
        path = undefined;
    }
}


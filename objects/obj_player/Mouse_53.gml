var size = aStar_get_cell_size();
if(path != undefined)
{
    //If we are currently moving, stop the path and snap to the cell
    path_end();
    x -= x mod size;
    y -= y mod size;
}
var ourX = aStar_get_cell_coordinate(x);
var ourY = aStar_get_cell_coordinate(y);
var targetX = aStar_get_cell_coordinate(mouse_x);
var targetY = aStar_get_cell_coordinate(mouse_y);
path = aStar_find_path(ourX, ourY, targetX, targetY);
if(path != undefined)
{
    path_start(path, pathSpeed, path_action_reverse, true);
    endPosition = position_create(path_get_point_x(path, path_get_number(path) - 1), path_get_point_y(path, path_get_number(path) - 1));
}


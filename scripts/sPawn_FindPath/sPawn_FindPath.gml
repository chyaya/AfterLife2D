var size = aStar_get_cell_size();
if(m_Path != undefined)
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

m_Path = aStar_find_path(ourX, ourY, targetX, targetY);

if(m_Path != undefined)
{
    path_start(m_Path, m_MoveSpeed, path_action_reverse, true);
	
    m_EndPosition = position_create(
		path_get_point_x(m_Path, path_get_number(m_Path) - 1),
		path_get_point_y(m_Path, path_get_number(m_Path) - 1));
}


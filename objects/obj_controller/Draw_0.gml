draw_text(0, 0, string_hash_to_newline("Diagonal movement (enter): " + string(aStar_get_diagonal_movement())));
draw_text(0, 20, string_hash_to_newline("Cutting blocked corners (shift): " + string(aStar_get_cutting_blocked_corners())));
var size = aStar_get_cell_size() / 2;
if(path != undefined)
{
    for(var i = 0; i < path_get_number(path) - 1; i ++)
    {
        draw_line(path_get_point_x(path, i) + size, path_get_point_y(path, i) + size, path_get_point_x(path, i + 1) + size, path_get_point_y(path, i + 1) + size);
    }
}


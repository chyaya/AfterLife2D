/// @description aStar_set_blocked(x, y, blocked)
/// @param x
/// @param  y
/// @param  blocked
/*
 * Makes the given cell blocked/unblocked.
 *
 * x:       The x-coordinate, in cell-coordinates, not world coordinates
 * y:       The y-coordinate, in cell-coordinates, not world coordinates
 * blocked: if the cell should be blocked (true) or not (false)
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
{
    if(argument0 >= 0 && argument0 < ds_grid_width(oPathFinder.cells) && argument1 >= 0 && argument1 < ds_grid_height(oPathFinder.cells))
        ds_grid_set(oPathFinder.cells, argument0, argument1, argument2);
}

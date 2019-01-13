/// @description aStar_get_blocked(x, y)
/// @param x
/// @param  y
/*
 * Checks if the given cell is currently blocked.
 *
 * x: The x-coordinate, in cell-coordinates, not world coordinates
 * y: The y-coordinate, in cell-coordinates, not world coordinates
 *
 * Returns: true if the cell is blocked, false otherwise, or undefined if the pathfinder
 *          is not initialized.
*/
if(instance_exists(oPathFinder))
{
    if(argument0 >= 0 && argument0 < ds_grid_width(oPathFinder.cells) && argument1 >= 0 && argument1 < ds_grid_height(oPathFinder.cells))
        return ds_grid_get(oPathFinder.cells, argument0, argument1);
}
return undefined;

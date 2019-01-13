/// @description aStar_set_width(width)
/// @param width
/*
 * Sets the new width (amount of cells horizontally) of the grid.
 *
 * width: The new width
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
{
    ds_grid_resize(oPathFinder.cells, argument0, ds_grid_height(oPathFinder.cells));
}

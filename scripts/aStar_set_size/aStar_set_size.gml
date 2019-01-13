/// @description aStar_set_size(width, height)
/// @param width
/// @param  height
/*
 * Sets the new width (amount of cells horizontally) and the height (amount of cells
 * vertically) of the grid.
 *
 * width:  The new width
 * height: The new height
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
{
    ds_grid_resize(oPathFinder.cells, argument0, argument1);
}

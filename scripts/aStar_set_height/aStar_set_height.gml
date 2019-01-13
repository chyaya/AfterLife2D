/// @description aStar_set_height(height)
/// @param height
/*
 * Sets the new height (amount of cells vertically) of the grid.
 *
 * height: The new height
 *
 * Returns: None
*/
if(instance_exists(oPathFinder))
{
    ds_grid_resize(oPathFinder.cells, ds_grid_width(oPathFinder.cells), argument0);
}

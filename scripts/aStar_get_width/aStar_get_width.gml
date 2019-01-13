/// @description aStar_get_width()
/*
 * Gives the width (amount of cells horizontally) of the grid
 *
 * Returns: The amount of cells horizontally, or undefined if the pathfinder is not
 *          initialized
*/
if(instance_exists(oPathFinder))
{
    return ds_grid_width(oPathFinder.cells);
}
return undefined;

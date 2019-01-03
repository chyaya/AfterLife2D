/// @function		scr_BSP_Get(grid, cell_size, x, y);
/// @param {index}	grid		The BSP grid to use
/// @param {int}	cell_size	The size (in pixels) of an individual grid cell
/// @param {real}	x			The x position in the room to get the grid value of
/// @param {real}	y			The y position in the room to get the grid value of

/// @description	With this script you can retrieve a value from a BSP grid

var _x = floor(argument2 / argument1);
var _y = floor(argument3 / argument1);

if _x >= 0 && _x < ds_grid_width(argument0) && _y >= 0 && _y < ds_grid_height(argument0)
{
return argument0[# _x, _y];
}
else show_debug_message("BSP: scr_BSP_Get out of bounds");



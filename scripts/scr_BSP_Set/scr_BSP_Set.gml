/// @function		scr_BSP_Set(grid, cell_size, x, y, value);
/// @param {index}	grid		The BSP grid to use
/// @param {int}	cell_size	The size (in pixels) of an individual grid cell
/// @param {real}	x			The x position in the room to get the grid value of
/// @param {real}	y			The y position in the room to get the grid value of
/// @param {real}	value		The value to set the grid cell to

/// @description	With this script you can retrieve a value from a BSP grid

var _x = floor(argument2 / argument1);
var _y = floor(argument3 / argument1);

if _x >= 0 && _x < ds_grid_width(argument0) && _y >= 0 && _y < ds_grid_height(argument0)
{
argument0[# _x, _y] = argument4;
}
else show_debug_message("BSP: scr_BSP_Set out of bounds");




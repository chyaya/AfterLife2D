/// @function		sBSP_Create(cell_size, split_num);
/// @param {int}	cell_size	The size of an individual grid cell
/// @param {int}	split_num	The number of times to split the main room to create sub-rooms

/// @description	Initialise the main grid that will be used to generate the dungeon.		



//Randomise the starting seed
randomize();

//create the cell_size variable
cell_size = argument0;

// DEBUG!!!!!!!!!!!!!!!!!!!!! /////////////////////////////////////////////////////////

// This debug code is required for the script sBSP_DrawDebug and 
// should only be removed when NOT using that script otherwise you 
// will get errors. If you remove the debug code this script will require
// no arguments and the call in the obj_BSP_Create will need to be modified.

for (var i = 0; i < argument1; i++;)
    {
    col[i] = make_color_hsv((i * 12) mod 255, 100 + random(55), 155 + random(100));
    }
show_debug_message("BSP: Room random seed is " + string(random_get_seed()));

///////////////////////////////////////////////////////////////////////////////////////

show_debug_message("BSP: Room width(" + string(room_width) + "), Room height(" + string(room_height) + ")");

// Create and clear the grid then return it for future use
var grid = ds_grid_create((room_width div cell_size) - 2, (room_height div cell_size) - 2);
ds_grid_clear(grid, 0);

return grid;

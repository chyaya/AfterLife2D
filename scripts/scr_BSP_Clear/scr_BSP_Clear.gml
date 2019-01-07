/// @function		scr_BSP_Clear(grid);
/// @param {index}	grid	The BSP grid to clear

/// @description	Tidy up after using the BSP scripts...

show_debug_message("BSP: CLEAR GRID DATA!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

// Remove the tunneler object
with (oBSP_Tunneler) instance_destroy();

// Remove the ds_grid
ds_grid_destroy(argument0);

// This is an example instance for an enemy object that can be spawned.
// Note that it is a child of the BSP collision parent, so that it won't 
// over-lap with other instances when spawned.

// Scale for the demo rooms... 
image_xscale = (global.cellSize / 16);
image_yscale = image_xscale;

// Add the instance into the BSP grid for collision checking
scr_BSP_Set(obj_DEMO_BSP.bsp_grid, global.cellSize, x, y, id);
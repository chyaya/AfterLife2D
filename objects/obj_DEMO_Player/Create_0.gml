// Adjust the scale based on the tile size used. This is normally only required 
// For the DEMO since you should be using a fixed size and have pre-created GFX
// in a finished game.
image_xscale = (global.cellSize / 16);
image_yscale = image_xscale;

ang = 0;			// rotating angle for drawing the sprite
debug_draw = false;	// controls drawing the copied BSP grid (see below)

// Create a ds grid. This will hold the BSP grid data after the room has been
// generated. The player instance will use this data for collision checking
// instead of using the regular collisions...
grid = ds_grid_create(room_width / global.cellSize, room_height / global.cellSize);


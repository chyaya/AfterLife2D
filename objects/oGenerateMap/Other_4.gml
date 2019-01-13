show_debug_message("Init Generate Map");

// This is our controller object and should be placed in any room where we 
// want to generate our random map. It creates a ds_grid that is populated 
// with the following values:
/*

bsp_empty       - Empty grid cell (ie: "floor")
0 - 99			- A "room" number within the grid that hasn't been assigned
bsp_wall        - A "wall" for a room area
bsp_outer_wall  - The outer "wall" of the whole room
bsp_corridor    - A "corridor" between rooms
bsp_door_h/v	- A "door" into a room area. bsp_door_h = horizontal door, bsp_door_v = vertical door
500 - 1000		- The pathfinder start points for making corridors

*/
// The grid created can then be parsed and the appropriate object created
// based on the return value for each grid cell.

// These scripts work by repeatedly splitting a GMS room into smaller and smaller 
// grid sections. They then create a "room" area within each section of the grid 
// which are joined together using "corridors". The number of room areas created
// will largely depend on the size of the actual room in GameMaker as well as
// the number of splits that you assign and the size of the base tile to use.

// NOTE: You can give large numbers for the splits to achieve and the scripts 
// will TRY to create them, but may not succeed if the split size is too small



// Create some initial vars to control basic size and form of the rooms/grid
// NOTE: The global vars here are from the DEMO init object, but can be replaced 
// with real numbers or constants etc... as your game requires.

var split_width_min = 3;  // The minimum size of each "room" in the map (minimum value = 3)
var split_skip_num = 8;    // Rooms can be skipped, creating empty spaces in the map
var split_num = 48;         // The number of slpits that the scripts should TRY to create
var cell_size = 16;

// Create the BSP ds_grid (Note the global variable! As with above, you can use
// a real or other value here as the global is only added for convenience in this demo
bsp_grid = sBSP_Create(cell_size, split_num);


// Split the room and populate the grid with the initial areas for the map
sBSP_SplitRoom(bsp_grid, split_width_min, split_num);


// Parse the room grid and generate "rooms" within each split area
// if you have chosen a value for rooms to skip, then you MAY have empty areas 
// within the map, but not always, as the scripts adapt to always have a minimum 
// number of rooms (2) to prevent errors. The script returns the number of rooms
// that have been created which is required in future scripts.

// The script will also generate an array r[a, b], where [a] is the room number 
// and [b] is the x, y, width, and height. So, for example, to get the grid 
// center of the first room area generated we could do the following:

/*
var xx = r[0, 0];
var yy = r[0, 1];
var ww = r[0, 2];
var hh = r[0, 3];
var xpos = xx + (ww div 2);
var ypos = yy + (hh div 2);
instance_create(xx * cell_size, yy * cell_size, OBJECT);
*/

// this is VERY IMPORTANT as it permits you to then use the scr_BSP_Create_Object
// script to create your own objects anywhere within the map and be sure that 
// they are inside a room.

var count = sBSP_CreateRoomSpace(bsp_grid, split_skip_num);


// This script creates the "wall" spaces around the rooms in the map.

sBSP_CreateInternalWalls(bsp_grid, count, cell_size);


// This script uses pathfinding to create "corridors" between rooms

sBSP_CreateCorridors(bsp_grid, cell_size, count);


// This script is for cleaning up. It is commented out since for the demo/example
// we don't want to destroy it yet as it's being drawn to the screen, but when not 
// debugging it can be uncommented (it is currently used in the Clean Up event)

// sBSP_Clear(bsp_grid);

sBuildMap(bsp_grid, cell_size, count, noone, noone, "Instances", "Instances");



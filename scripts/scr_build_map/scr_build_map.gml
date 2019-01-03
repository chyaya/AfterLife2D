/// @function			scr_BSP_Create_Objects(grid, cell_size, room_count, wall_object, door_object, wall_layer, instance_layer);
/// @param	{index}		grid			The BSP grid to use
/// @param	{int}		cell_size		The cell size of each grid aquare
/// @param	{int}		room_count		The number of sub-rooms to go through
/// @param	{index}		wall_object		The wall object to use
/// @param	{index}		door_object		The door object to use
/// @param	{string}	wall_layer		The layer to create walls and doors on
/// @param	{string}	instance_layer	The layer to create player and enemy, etc... instances on

/// @description	This script is for creating the objects in your room. How you 
///					do this will depend largely on what you want and how your game works.
///					For convenience it contains the most required objects by the BSP 
///					engine, which is walls and doors, but you can add further objects easily.
///					For example, you can add values directly to the DS_grid using the 
///					the "count" variable and the room array "r" (see the create event 
///					of "obj_BSP_Generate" for more info), and then create the instances 
///					by adding a further case.
///					
///					To show you how this would work, the DEMO will create a "player" object 
///					in the center of a random room, as well as spawn a number of "enemy"
///					objects in random rooms. The player object is hard-coded into the script, 
///					simply because you always need to have a player object, but can easily be 
///					substituted for a player spawner or whatever is required.
///					
///					Note that all objects that you wish to spawn WITHOUT the possibility of 
///					an overlap should be children of the object "obj_BSP_Collision_Parent"
///					as the spawning scripts use this for checking. If having two instances 
///					occupy the same space is not an issue, then you need not use this parent.
///					
///					This script also shows how you can use TILES to mark the floors of the 
///					rooms, doors and the corridors. This is an optional extra but works well 
///					and gives a nice touch to the game.

show_debug_message("BSP: CREATE OBJECTS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

var grid_w = ds_grid_width(argument[0]);
var grid_h = ds_grid_height(argument[0]);
var ts = argument[1];
var cc = argument[2];

// Create the local vars
var pos = irandom(cc - 1);                                      // This will be the room the player is spawned in
var xx = r[pos, 0] * ts;                                        // The x position of the room to spawn in (and convert to pixels multiplying by the grid tile size)
var yy = r[pos, 1] * ts;                                        // The y position of the room to spawn in
var ww = (r[pos, 2] div 2) * ts;                                // Now get the half width of the room
var hh = (r[pos, 3] div 2) * ts;                                // Now get the half height of the room
instance_create_layer(xx + ww - 8, yy + hh - 8, argument[5], obj_ghost);     // Create the player!

// The following adds the walls, doors and floor tiles for the room using loops.
// As you can see we have two sprites for horizontal and vertical doors (you can 
// easily change this), and we use two different tiles for the floors and corridors.
// This gives a nice graphic touch but is not necessary. Note that the tiles do not 
// have to be square, nor power of two, and the script will stretch them to fit the 
// grid size.

// NOTE! In the demo I have variable cell sizes to show off the engine, so to add
// floor tiles I have to use an ASSET layer and add sprites then scale them. In a
// real game, you will probably have a fixed cell size and use tiles, so I've
// included the tile code too as comments. SImply comment out all the sprite code, 
// and uncomment the tile code to use (and make sure you have a layer for tiles in 
// the room!).

var _l = layer_get_id("Tiles");
var _m = layer_tilemap_get_id(_l); // Uncomment for tiles!

var _xs = ts / sprite_get_width(spr_DEMO_Floor_Empty);
var _ys = ts  / sprite_get_height(spr_DEMO_Floor_Empty);

for (var i = 0; i < grid_w; i++;)
{
for (var j = 0; j < grid_h; j++;)
    {
    var tile = -1;
    switch(ds_grid_get(argument[0], i, j))
        {
        case bsp_empty: // Add floor tiles
            break;
        case bsp_wall: //Create wall objects
        	tilemap_set(_m, 24, i, j); // Uncomment for tiles!
            break;
        case bsp_corridor: // Add corridor tiles
            break;
        case bsp_door_h: //Create horizontal door
            break;
        case bsp_door_v: //Create vertical door
            break;
        }
    }
}

// We now call another set of scripts to create different objects. These scripts 
// assume a couple of things:

// 1) the origin of the sprite for the instance being created has been CENTERED

// 2) the instance being created is NOT scaled, so if you need to scale the instance
// use a new sprite resource and scale that then assign it to the object.

// 3) the order in which you create things is VERY important. Those that don't require 
// collision checks (ie: don't use the BSP collision parent) should be created FIRST
// then any essential instances that MUST be in the game are created next (like the BOSS
// in the example script calls below), then finally any other instances. This is because
// the spawn scripts may not spawn 100% of all instances if the room area being spawned 
// in is too small for the number of instances being created. Imagine trying to spawn 
// 2000 enemies in a 5x5 room! 

// NOTE! These scripts given below are examples only to give you an idea of how to go 
// about things. You will have to adjust and change these script arguments to suit your 
// or write your own scripts and call them here...


/*

// Spawn a potion object in every room area, including the player area. 
// Note that we do this BEFORE we spawn anything else, as it does NOT 
// use the BSP collision parent, and we want to spawn things over them.
scr_BSP_Populate_Rooms(obj_DEMO_Potion, cc, cc, -1, ts, true, true, argument[6]);

// Now spawn a room full of gold that is NOT the player room
var ran = irandom(cc - 1);
while (ran == pos) ran = irandom(cc - 1);
scr_BSP_Populate_Area(obj_DEMO_Gold, 20, ran, ts, false, argument[6]);

// Spawn a boss in a random room that is NOT the player room
var ran = irandom(cc - 1);
while (ran == pos) ran = irandom(cc - 1);
scr_BSP_Populate_Area(obj_DEMO_Boss, 1, ran, ts, true, argument[6]);
    
// Spawn 200 enemies randomly throughout the WHOLE maze, and not just one room
scr_BSP_Populate_Rooms(obj_DEMO_Enemy, 200, cc, pos, ts, false, true, argument[6]);


*/
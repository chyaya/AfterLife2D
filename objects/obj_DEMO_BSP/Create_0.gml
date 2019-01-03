// This is basically the same object as the obj_BSP_Generate, only without comments.
// It also adds OBJECTS into the room, and prepares the view, player, etc... just 
// as you would in a real game.

var split_width_min = global.splitSize;
var split_skip_num = global.roomSkip;
var split_num = global.splitNum;

bsp_grid = scr_BSP_Create(global.cellSize, split_num);
/*

In a normal game you'd have all the code to generate the room in the CREATE 
event of the controller instance, but for the demo I've moved it into the 
STEP event so that you can see the process of generation a step at a time.
Below is the same code as it would appear in a normal situation...

scr_BSP_Split_Room(bsp_grid, split_width_min, split_num);
scr_BSP_Create_Room_Space(bsp_grid, split_skip_num);
scr_BSP_Create_Internal_Walls(bsp_grid, count, cell_size);
scr_BSP_Create_Corridors(bsp_grid, cell_size, count);
// Here we create the objects...
scr_BSP_Create_Objects(bsp_grid, cell_size, count, obj_DEMO_Wall, obj_DEMO_Door, "Instances", "Instances");
// and destroy the instance as it is no longer necessary
instance_destroy();
*/

// Controller variables for stepping/drawing/playing in the demo
// These would be removed in a normal use situation...
debug_draw = true;
iteration = 0; // Set iterations so you can step through the room creation

window_center();


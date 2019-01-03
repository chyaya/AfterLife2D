/// @description Step Through Room Creation

if mouse_check_button_pressed(mb_left)
{
var split_width_min = global.splitSize;
var split_skip_num = global.roomSkip;
var split_num = global.splitNum;
switch(iteration)
	{
	case 0: scr_BSP_Split_Room(bsp_grid, split_width_min, split_num); break;
	case 1: count = scr_BSP_Create_Room_Space(bsp_grid, split_skip_num); break;
	case 2: scr_BSP_Create_Internal_Walls(bsp_grid, count, cell_size); break;
	case 3: scr_BSP_Create_Corridors(bsp_grid, cell_size, count); break;
	case 4: 
		// Here we create the objects...
		scr_BSP_Create_Objects(bsp_grid, cell_size, count, obj_DEMO_Wall, obj_DEMO_Door, "Instances", "Instances");
		// Just for this demo, we are going to pass a copy of the grid
		// through to the player object. We do this so that the player object
		// can use the grid for collision checking, which is much more efficient
		// than instance checking... NOTE! It would probably be better to set
		// a GLOBAL variable to hold the output DS grid, as that way all instances
		// can access it without relying on an instance to store it.
		with (obj_DEMO_Player)
			{
			ds_grid_copy(grid, other.bsp_grid);
			}
		// and destroy the instance as it is no longer necessary
		instance_destroy();
		break;
	}
iteration++;
}
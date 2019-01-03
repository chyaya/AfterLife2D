/// @function		scr_BSP_Create_Room_Space(grid, skip_num);
/// @param {index}	grid			The room grid to use
/// @param {int}	skip_num		The number of rooms to skip

/// @description	This script creates the sub-room spaces within the splits defined previously. You
///					give the DS grid to use and then the script will split it into sub-rooms. If you
///					set a skip value greater than 0, then some sub-rooms will be ommited, giving a
///					more organic feel to the game room layout (corridors will be added to connect
///					rooms as required).

show_debug_message("BSP: CREATE SUB-ROOM SPACES!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

var gw = ds_grid_width(argument0);
var gh = ds_grid_height(argument0);

//Get the number of areas from the argument0
var grid_max = ds_grid_get_max(argument0, 0, 0, gw - 1, gh - 1) + 1;

//Create the skip list
var room_skip_num = min(argument1, grid_max - 1);
var room_skip_list = ds_list_create();

repeat (grid_max)
{
//Add the rooms to skip to the list. True = can be skipped, false = can't
if room_skip_num > 0
    {
    ds_list_add(room_skip_list, true);
    room_skip_num -= 1;
    }
else ds_list_add(room_skip_list, false);
}

//Shuffle the room list to create a random choice
ds_list_shuffle(room_skip_list);

//Setup the room counter
var room_current = 0;
var room_count = 0;

//loop through the areas...
repeat(grid_max)
{
if !ds_list_find_value(room_skip_list, room_current) && ds_grid_value_exists(argument0, 0, 0, gw, gh, room_current)
    {
    //loop through the argument0 to find the current room...
    var area_min = -4;
    for (var hh = 0; hh < gh; hh++;)
        {
        for (var ww = 0; ww < gw; ww++;)
            {
            if ds_grid_get(argument0, ww, hh) == room_current
                {
                if area_min < room_current
                    {
                    area_min = room_current;
                    area_x1 = ww;
                    area_y1 = hh;
                    }
                else
                    {
                    area_x2 = ww;
                    area_y2 = hh;
                    }
                }
            }
        }
    //Get the width and height of the room area...
    var area_w = area_x2 - area_x1;
    var area_h = area_y2 - area_y1;
            
    room_x = area_x1;
    room_y = area_y1;
    
    room_w = area_w - 1;
    room_h = area_h - 1;
    
    if area_x2 >= gw - 2
        {
        room_w = area_w;
        }
    if area_y2 > gh - 2
        {
        room_h = area_h;
        }
    
    //Set the ds_grid for the room space to "bsp_empty"...
    ds_grid_set_region(argument0, max(room_x, 0), max(room_y, 0), min(room_x + room_w, gw - 1), min(room_y + room_h, gh - 1), bsp_empty);
	
/*	var _xx = max(room_x, 0);
	var _yy = max(room_y, 0);
	var _xw = min(room_x + room_w, gw - 1);
	var _yh = min(room_y + room_h, gh - 1)
	ds_grid_set_region(argument0, _xx, _yy, _xw, _yh, bsp_wall);
	var _xr = floor((_xw - _xx) / 2);
	var _yr = floor((_yh - _yy) / 2);
	var _r = min(_xr, _yr);
	ds_grid_set_disk(argument0, _xx + _xr, _yy + _yr, _r, bsp_empty);
	ds_grid_set(argument0, _xx + _xr, _yy + _yr, 501 + room_count);
*/	
    //Set the pathing point for the room
    ds_grid_set(argument0, min(room_x + floor(random(room_w - 1)), gw), min(room_y + floor(random(room_h - 1)), gh - 1), 501 + room_count);
    
    //Here we set an array with the room details
    r[room_count, 0] = room_x;
    r[room_count, 1] = room_y;
    r[room_count, 2] = room_w;
    r[room_count, 3] = room_h;
    
    room_count++;
    }
room_current++;
}

ds_list_destroy(room_skip_list);

return room_count;

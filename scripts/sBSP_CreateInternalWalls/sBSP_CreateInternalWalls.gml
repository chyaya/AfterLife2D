/// @function		sBSP_CreateInternalWalls(grid, room_total, base_size);
/// @param {index}	grid		The BSP grid to use
/// @param {int}	room_total	The total number of sub-rooms created
/// @param {int}	base_size	The base cell size in the game room

/// @description	This script will go through each of the sub-rooms and add wall markers
///					to the DS grid. It will also flag door spaces and place the player object
///					start position.

show_debug_message("BSP: CREATE INTERNAL WALLS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

var grid_w = ds_grid_width(argument0);
var grid_h = ds_grid_height(argument0);

//Resize the grid so that there is a border zone...
ds_grid_resize(argument0, grid_w + 2, grid_h + 2);
ds_grid_set_grid_region(argument0, argument0, 0, 0, grid_w, grid_h, 1, 1);

grid_w = ds_grid_width(argument0);
grid_h = ds_grid_height(argument0);

//Add outer walls for the pathfinder
var i = 0;
repeat (grid_w)
    {
    ds_grid_set(argument0, i, 0, bsp_outer_wall);
    ds_grid_set(argument0, i, grid_h - 1, bsp_outer_wall);
    i++;
    }
i = 0;
repeat (grid_h)
    {
    ds_grid_set(argument0, 0, i, bsp_outer_wall);
    ds_grid_set(argument0, grid_w - 1, i, bsp_outer_wall);
    i++;
    }

//Add inner walls to the sub-rooms...
var rm = 0;
repeat(argument1)
{
var xx = max(r[rm ,0], 0);
var yy = max(r[rm ,1], 0);
var ww = median(0, r[rm, 2] + 2, grid_w - 1);
var hh = median(0, r[rm, 3] + 2, grid_h - 1);
i = xx;
repeat (ww)
    {
    if ds_grid_get(argument0, i, yy) != bsp_empty ds_grid_set(argument0, i, yy, bsp_wall);
    if ds_grid_get(argument0, i, min(yy + hh, grid_h - 1)) != bsp_empty ds_grid_set(argument0, i, min(yy + hh, grid_h - 1), bsp_wall);
    i++;
    }
i = yy;
repeat (hh + 1)
    {
    if ds_grid_get(argument0, xx, i) != bsp_empty ds_grid_set(argument0, xx, i, bsp_wall);
    if ds_grid_get(argument0, min(xx + ww, grid_w - 1), i) != bsp_empty ds_grid_set(argument0, min(xx + ww, grid_w - 1), i, bsp_wall);
    i++;
    }
rm ++;
}

//Open door spaces in the inner walls
rm = 0;
var gdist = 4;

repeat(argument1)
{
xx = r[rm, 0];
yy = r[rm, 1];
ww = r[rm, 2] + 2;
hh = r[rm, 3] + 2;

//Check distance friom the edge of the screen and if there is enough room for a corridor to pass, open a door...
if yy >= gdist //point_distance(ttx, tty, ttx, 0) > gdist
    {
    var pos = min(xx + 2 + floor(random(ww - 4)), grid_w - 1);
    ds_grid_set(argument0, pos, yy, bsp_empty);
    //if ds_grid_get(argument0, pos, yy - 1) == 100 ds_grid_set(argument0, pos, yy - 1, -4);
    }
if xx >= gdist //point_distance(ttx, tty, 0, tty) > gdist
    {
    var pos = min(yy + 2 + floor(random(hh - 4)), grid_h - 1);
    ds_grid_set(argument0, xx, pos, bsp_empty);
    //if ds_grid_get(argument0, xx - 1, pos) == 100 ds_grid_set(argument0, xx - 1, pos, -4);
    }
if xx + ww <= grid_w - gdist //point_distance((xx + ww) * argument0, tty, room_width, tty) > gdist
    {
    var pos = min(yy + 2 + floor(random(hh - 4)), grid_h - 1);
    ds_grid_set(argument0, min(xx + ww, grid_w - 1), pos, bsp_empty);
    //if ds_grid_get(argument0, min(xx + ww + 1, grid_w - 1), pos) == 100 ds_grid_set(argument0, min(xx + ww + 1, grid_w - 1), pos,-4);
    }
if yy + hh <= grid_h - gdist //point_distance(ttx, (yy + hh) * argument0, xx * argument0, room_height) > gdist
    {
    var pos = min(xx + 2 + floor(random(ww - 4)), grid_w - 1)
    ds_grid_set(argument0, pos, min(yy + hh, grid_h - 1), bsp_empty);
    //if ds_grid_get(argument0, pos, min(yy + hh + 1, grid_h - 1)) == -100 ds_grid_set(argument0, pos, min(yy + hh + 1, grid_h - 1), -4);
    }
rm++;
}

pos = max(0, floor(random(rm - 1)));

//Choose a place to put the player...
global.Player_x = (r[pos,0] * argument2) + ((((r[pos,2] + 2) / 2) * argument2));
global.Player_y = (r[pos,1] * argument2) + ((((r[pos,3] + 2) / 2) * argument2));

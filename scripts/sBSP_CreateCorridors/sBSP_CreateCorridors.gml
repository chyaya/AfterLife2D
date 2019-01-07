/// @function		sBSP_CreateCorridors(grid, cell_size, room_total);
/// @param {index}	grid			The BSP grid to use
/// @param {int}	cell_size		The size (in pixels) of a single cell in the grid
/// @param {int}	room_total		The number of sub-rooms in the game room

/// @description	This script creates corridors between the rooms. If you have 
///					chosen to skip rooms when generating, then there will be empty
///					spaces in your maze/dungeon and some rooms won't be connected.
///					To solve this, we use this script to flag grid cells as corridors
///					and link up all the rooms.
///
///					IMPORTANT! This script reuires that the object "oBSP_Tunneler"
///					so please do not remove this object from the project.

show_debug_message("BSP: CREATE CORRIDORS!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");

var grid_w = ds_grid_width(argument0);
var grid_h = ds_grid_height(argument0);

//Create the mp_grid...
var room_grid = mp_grid_create(0, 0, grid_w, grid_h, argument1, argument1);

//Add the walls into the grid...
for (var j = 0; j < grid_h; j++;)
{
for (var i = 0; i < grid_w; i++;)
    {
    if ds_grid_get(argument0, i, j) == bsp_wall || ds_grid_get(argument0, i, j) == bsp_outer_wall mp_grid_add_cell(room_grid, i, j);
    }
}

//Now create a tunneller at the correct position within the rooms and assign a path...
var inst;
var n = 0;
for (j = 0; j < grid_h; j++;)
{
for (i = 0; i < grid_w; i++;)
    {
    if ds_grid_get(argument0, i, j) > -1
        {
        if ds_grid_get(argument0, i, j) > 500 && ds_grid_get(argument0, i, j) < 1000
            {
            inst[n] = instance_create_depth((i * argument1), (j * argument1), 1000, oBSP_Tunneler);
            inst[n].num = n;
            path[n] = path_add();
            n++;
            }
        }
    }
}

//CONNECT THE ROOMS
//Create the paths from tunneler instance to tunneler instance...
i = 0;
repeat (n)
{
if i < n - 1
    {
    mp_grid_path(room_grid, path[i], inst[i].x, inst[i].y, inst[i + 1].x, inst[i + 1].y, false);
    }
else
    {
    mp_grid_path(room_grid, path[i], inst[i].x, inst[i].y, inst[0].x, inst[0].y, false);
    }
i++;
}

//Set the path to the grid...
i = 0;
repeat(n)
{
path_num = path_get_number(path[i]);
pos = 0;
for (j = 0; j < path_num; j++;)
    {
    ds_grid_set(argument0, floor(path_get_point_x(path[i], pos) / argument1), floor(path_get_point_y(path[i], pos) / argument1), bsp_corridor);
    pos++;
    }
i++;
}

//Clean up...
i = 0;
repeat (n)
{
path_delete(path[i]);
i++;
}

mp_grid_destroy(room_grid);

//Add inner walls to the rooms again to fill in any unused door spaces and add doors to the spaces the path uses...
rm = 0;
repeat(argument2)
{
var xx = max(r[rm, 0], 0);
var yy = max(r[rm, 1], 0);
var ww = min(r[rm, 2] + 2, grid_w - 1);
var hh = min(r[rm, 3] + 2, grid_h - 1);
i = xx;
repeat (ww)
    {
    if ds_grid_get(argument0, i, yy) == bsp_empty 
        {
        ds_grid_set(argument0, i, yy, bsp_wall); //Fill gap with wall
        }
    else
        {
        if ds_grid_get(argument0, i, yy) == bsp_corridor
            {
            ds_grid_set(argument0, i, yy, bsp_door_h); //Fill gap with horizontal door
            }
        }
    if ds_grid_get(argument0, i, yy + hh) == bsp_empty 
        {
        ds_grid_set(argument0, i, yy + hh, bsp_wall);
        }
    else
        {
        if ds_grid_get(argument0, i, yy + hh) == bsp_corridor 
            {
            ds_grid_set(argument0, i, yy + hh, bsp_door_h);
            }
        }
    i++;
    }
i = yy;
repeat (hh + 1)
    {
    if ds_grid_get(argument0, xx, i) == bsp_empty
        {
        ds_grid_set(argument0, xx, i, bsp_wall); //Fill gap with wall
        }
    else
        {
        if ds_grid_get(argument0, xx, i) == bsp_corridor
            {
            ds_grid_set(argument0, xx, i, bsp_door_v); //Fill gap with vertical door
            }
        }
    if ds_grid_get(argument0, xx + ww, i) == bsp_empty
        {
        ds_grid_set(argument0, xx + ww, i, bsp_wall);
        }
    else
        {
        if ds_grid_get(argument0, xx + ww, i) == bsp_corridor
            {
            ds_grid_set(argument0, xx + ww, i, bsp_door_v);
            }
        }
    i+=1;
    }
rm++;
}

//Clear the room again to get rid of any unwanted walls...
rm = 0;
repeat(argument2)
{
ds_grid_set_region(argument0, r[rm, 0] + 1, r[rm, 1] + 1, r[rm, 0] + r[rm, 2] + 1, r[rm, 1] + r[rm, 3] + 1, bsp_empty);
rm += 1;
}

//Add markers to the grid so that walls are created around the corridors...
for (j = 0; j < grid_h; j++;)
{
for (i = 0; i < grid_w; i++;)
    {
    if ds_grid_get(argument0, i, j) == bsp_corridor
        {
        if ds_grid_get(argument0, i + 1, j + 1) < bsp_corridor && ds_grid_get(argument0, i + 1, j + 1) != bsp_empty 
            {
            ds_grid_set(argument0, i + 1, j + 1, bsp_wall);
            }
        if ds_grid_get(argument0, i + 1, j) < bsp_corridor && ds_grid_get(argument0, i + 1, j) != bsp_empty
            {
            ds_grid_set(argument0, i + 1, j, bsp_wall);
            }
        if ds_grid_get(argument0, i + 1, j - 1) < bsp_corridor && ds_grid_get(argument0, i + 1, j - 1) != bsp_empty
            {
            ds_grid_set(argument0, i + 1, j - 1, bsp_wall);
            }
        if ds_grid_get(argument0, i - 1, j + 1) < bsp_corridor && ds_grid_get(argument0, i - 1, j + 1) != bsp_empty
            {
            ds_grid_set(argument0, i - 1, j + 1, bsp_wall);
            }
        if ds_grid_get(argument0, i - 1, j) < bsp_corridor && ds_grid_get(argument0, i - 1, j) != bsp_empty
            {
            ds_grid_set(argument0, i - 1, j, bsp_wall);
            }
        if ds_grid_get(argument0, i - 1, j - 1) < bsp_corridor && ds_grid_get(argument0, i - 1, j - 1) != bsp_empty
            {
            ds_grid_set(argument0, i - 1, j - 1, bsp_wall);
            }
        if ds_grid_get(argument0, i, j - 1) < bsp_corridor && ds_grid_get(argument0, i , j - 1) != bsp_empty
            {
            ds_grid_set(argument0, i, j - 1, bsp_wall);
            }
        if ds_grid_get(argument0, i, j + 1) < bsp_corridor && ds_grid_get(argument0, i , j + 1) != bsp_empty
            {
            ds_grid_set(argument0, i, j + 1, bsp_wall);
            }
        }
    if ds_grid_get(argument0, i, j) == bsp_door_h
        {
        if ds_grid_get(argument0, i - 1, j) != bsp_wall || ds_grid_get(argument0, i + 1, j) != bsp_wall ds_grid_set(argument0, xx, i, bsp_wall);
        }
    if ds_grid_get(argument0, i, j) == bsp_door_v
        {
        if ds_grid_get(argument0, i, j - 1) != bsp_wall || ds_grid_get(argument0, i, j + 1) != bsp_wall ds_grid_set(argument0, i, j, bsp_wall); // else ds_grid_set(argument0, i, j, 300);
        }
    }
}

//Add outer walls for the pathfinder
i = 0;
repeat (grid_w)
    {
    if ds_grid_get(argument0, i, 0) != bsp_outer_wall ds_grid_set(argument0, i, 0, bsp_wall);
    if ds_grid_get(argument0, i, grid_h - 1) != bsp_outer_wall ds_grid_set(argument0, i, grid_h - 1, bsp_wall);
    i++;
    }
i = 0;
repeat (grid_h)
    {
    if ds_grid_get(argument0, 0, i) != bsp_outer_wall ds_grid_set(argument0, 0, i, bsp_wall);
    if ds_grid_get(argument0, grid_w - 1, i) != bsp_outer_wall ds_grid_set(argument0, grid_w - 1, i, bsp_wall);
    i++;
    }

/// @function		scr_BSP_Draw_Debug(grid, cell_size);
/// @param {index}	grid		The BSP grid to use
/// @param {int}	cell_size	The size (in pixels) of an individual grid cell

/// @description	With this script you can draw debug information to the screen.

draw_set_halign(fa_center);
draw_set_font(fnt_BSP_Arial);

var i, j, n, c;
for (j = 0; j < ds_grid_height(argument0); j++;)
    {
    for (i = 0; i < ds_grid_width(argument0); i++;)
        {
        n=ds_grid_get(argument0,i,j);
            {
            if n = bsp_empty || n = -10 //Floor
                {
                c = c_gray;
                }
            else if n > 500 && n < 1000 //Pathfinder position
                {
                c = c_white;
                }
            else if n = bsp_wall //Wall
                {
                c = c_blue;
                }
            else if n = bsp_corridor //Corridor
                {
                c = c_aqua;
                }
            else if n = bsp_door_h || n = bsp_door_v//Door
                {
                c = c_yellow;
                }
            else if n = bsp_outer_wall //Room edge
                {
                c = c_maroon;
                }
            else c = col[n]; //Initial split number
            draw_rectangle_color(i * argument1, j * argument1, (i * argument1) + argument1, (j * argument1) + argument1,c,c,c,c,false);
            draw_text((i * argument1) + 8, (j * argument1) + 4, string_hash_to_newline(ds_grid_get(argument0, i, j)));
            }
        }
    }

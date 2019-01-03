/// @description 

// Debug draw the copied BSP collision grid
if keyboard_check(vk_f1)
{
draw_set_halign(fa_center);
var i, j, n, c;
var _sz = global.cellSize;
for (j = 0; j < ds_grid_height(grid); j++;)
    {
    for (i = 0; i < ds_grid_width(grid); i++;)
        {
        n = grid[# i, j];
		switch(n)
            {
			case bsp_empty: c = c_gray; break;
			case bsp_wall:
			case bsp_outer_wall: c = c_blue; break;
			case bsp_door_h:
			case bsp_door_v: c = c_lime; break;
			case bsp_DEMO_potion: c = c_orange; break;
			case bsp_DEMO_gold: c = c_yellow; break;
			default:
				if n > 10000
					{
					c = c_red;
					}
				break;
            }
		draw_rectangle_color(i * _sz, j * _sz, (i * _sz) + _sz, (j * _sz) + _sz,c,c,c,c,false);
		draw_text((i * _sz) + 8, (j * _sz) + 4, string(n));
        }
    }
}
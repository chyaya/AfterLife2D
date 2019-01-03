var pd = point_direction(x, y, mouse_x, mouse_y);

if mouse_check_button(mb_left)
{
/// This part of the player object shows how to use the BSP grid data for collision checking
/// Some of the game instances set their grid cell to a value when they are created, and we 
/// can then use this to do collision checks which are initially faster than regular collision
/// checks. In the example give, it is worth noting that the enemy instances store their 
/// unique ID value in the grid rather than a general macro value. This is to illustrate that 
/// the resulting BSP grid can hold any value  you like, and as long as you know what to look
/// for, it can be made very efficient!
var _x = round(x / global.cellSize);
var _y = round(y / global.cellSize);
var _xgoto = (_x + lengthdir_x(1, pd)) * global.cellSize;
var _ygoto = (_y + lengthdir_y(1, pd)) * global.cellSize;
var _val = scr_BSP_Get(grid, global.cellSize, _xgoto, _ygoto);
if _val > 10000
	{
	if instance_exists(_val)
		{
		with (_val) instance_destroy();
		}
	}
if !place_meeting(x + lengthdir_x(2, pd), y + lengthdir_y(2, pd), obj_DEMO_Wall)
    {
    x += lengthdir_x(2, pd);
    y += lengthdir_y(2, pd);
    }
else
    {
    repeat(2)
        {
        if !place_meeting(x + lengthdir_x(1, pd), y, obj_DEMO_Wall)
            {
            x += lengthdir_x(1, pd);
            }
        if !place_meeting(x, y + lengthdir_y(1, pd), obj_DEMO_Wall)
            {
            y += lengthdir_y(1, pd);
            }
        }
    }
}

var t_ang = angle_difference(pd, ang);
ang += median(-10, t_ang, 10);


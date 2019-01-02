var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed;

show_debug_message(string(move_speed_this_frame));


var last_x = x, last_y = y;

if(keyboard_check(ord("W")))
{
	y -= move_speed_this_frame;
}

if(keyboard_check(ord("S")))
{
	y += move_speed_this_frame;
}

if(keyboard_check(ord("A")))
{
	x -= move_speed_this_frame;
}

if(keyboard_check(ord("D")))
{
	x += move_speed_this_frame;
}

var xDir = x - last_x;
var yDir = y - last_y;

if(xDir > 0)
{
	image_xscale = 1;
}
else if(xDir < 0)
{
	image_xscale = -1;
}

var moved = xDir != 0 || yDir != 0;

if(last_moved != moved)
{
	if(moved)
	{
		sprite_index = spr_man_move;
	}
	else
	{
		sprite_index = spr_man_idle;
	}
		
	last_moved = moved;
}

/// @description Insert description here
// You can write your code in this editor

var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed;



show_debug_message(string(move_speed_this_frame));

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
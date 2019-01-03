yDir = 0;
xDir = 0;

if(keyboard_check(ord("W")))
{
	yDir -= 1;
}

if(keyboard_check(ord("S")))
{
	yDir += 1;
}

if(keyboard_check(ord("A")))
{
	xDir -= 1;
}

if(keyboard_check(ord("D")))
{
	xDir += 1;
}

if(mouse_check_button_pressed(mb_left))
{
	if(ability1 != noone)
		script_execute(ability1);
}
var dirX = argument0;
var dirY = argument1;

if(dirX > 0)
{
	if(dirY > 0)		return 315;
	else if(dirY < 0)	return 45;
	else				return 0;
}
else if(dirX < 0)
{
	if(dirY > 0)		return 225;
	else if(dirY < 0)	return 135;
	else				return 180;
}
else
{
	if(dirY > 0)		return 270;
	else if(dirY < 0)	return 90;
}

show_error("eight direction assert error", false);
return 0;
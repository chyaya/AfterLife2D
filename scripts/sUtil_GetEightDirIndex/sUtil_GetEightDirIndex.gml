var dirX = argument0;
var dirY = argument1;

if(dirY > 0)
{
	if(dirX > 0)		return 1;
	else if(dirX < 0)	return 7;
	else				return 0;
}
else if(dirY < 0)
{
	if(dirX > 0)		return 3;
	else if(dirX < 0)	return 5;
	else				return 4;
}
else
{
	if(dirX > 0)		return 2;
	else if(dirX < 0)	return 6;
	else				return 8;
}

show_error("eight direction assert error", false);
return 8;
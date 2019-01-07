var obj = argument0;
var xDir = argument1; 
var yDir = argument2; 

with(obj)
{
	if(m_CurHealth > 0)
	{
		if(xDir > 0)
		{
			image_xscale = 1;
		}
		else if(xDir < 0)
		{
			image_xscale = -1;
		}

		var moved = xDir != 0 || yDir != 0;

		if(moved)
		{
			sprite_index = sprite_index_move;
		}
		else
		{
			sprite_index = sprite_index_idle;
		}
	}
	else
	{
		sprite_index = sprite_index_dead;	
	}
	
	
}
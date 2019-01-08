var obj = argument0;
var dirX = argument1; 
var dirY = argument2; 

with(obj)
{
	if(m_CurHealth > 0)
	{
		if(dirX > 0)
		{
			image_xscale = 1;
		}
		else if(dirX < 0)
		{
			image_xscale = -1;
		}

		var moved = dirX != 0 || dirY != 0;

		if(m_Attacking)
		{
			sprite_index = m_SpriteIndex_Action;
		}
		else if(moved)
		{
			sprite_index = m_SpriteIndex_Move;
		}
		else
		{
			sprite_index = m_SpriteIndex_Idle;
		}
	}
	else
	{
		sprite_index = m_SpriteIndex_Dead;	
	}
	
	
}
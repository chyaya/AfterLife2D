var obj = argument0;
var m_DirX = argument1; 
var m_DirY = argument2; 

with(obj)
{
	if(m_CurHealth > 0)
	{
		if(m_DirX > 0)
		{
			image_xscale = 1;
		}
		else if(m_DirX < 0)
		{
			image_xscale = -1;
		}

		var moved = m_DirX != 0 || m_DirY != 0;

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
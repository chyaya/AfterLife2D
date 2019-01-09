/// @description Decrease Soul

if(m_PlayerObject.object_index == oGhost)
{
	if(m_CurSoulPoint > 0)
	{
		--m_CurSoulPoint; 
		
		sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul-1");
	}
}

alarm[0] = room_speed;
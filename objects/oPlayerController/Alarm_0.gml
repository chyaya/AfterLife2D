/// @description Decrease Soul

if(m_PlayerObject.object_index == oGhost)
{
	if(m_CurSoulPoint > 0)
		--m_CurSoulPoint; 
}

alarm[0] = room_speed;
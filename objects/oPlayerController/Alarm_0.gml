/// @description Decrease Soul

if(m_PlayerObject.object_index == oGhost)
{
	if(m_CurSoulPoint > 0)
	{
		var soulDamage = 1;
		if(room == room_Boss)
		{
			soulDamage = 666;
		}
		
		m_CurSoulPoint -= soulDamage;
		m_CurSoulPoint = max(m_CurSoulPoint, 0);
		
		sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul-" + string(soulDamage), 0, -30);
	}
}

alarm[0] = room_speed;
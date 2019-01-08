with (instance_create_layer(m_PlayerObject.x, m_PlayerObject.y, "Instances", oBlank))
{
	m_OwnerObj = other.m_PlayerObject.id;
		
	instance_change(oMelee, true);
}

m_PlayerObject.m_Attacking = true;
m_PlayerObject.alarm[0] = room_speed*0.1;
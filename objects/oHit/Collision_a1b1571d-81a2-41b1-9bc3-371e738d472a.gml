if(m_Hit == true)
	return;

if(other == m_OwnerObj)
	return;
	
if(other.m_AI_Control == m_OwnerObj.m_AI_Control)
	return;
	
if(other.object_index == oGhost)
	return;
	
if(other.m_CurHealth <= 0)
	return;

other.m_CurHealth = other.m_CurHealth - m_Damage;
other.m_CurHealth = clamp(other.m_CurHealth, 0, other.m_MaxHealth);
m_Hit = true;
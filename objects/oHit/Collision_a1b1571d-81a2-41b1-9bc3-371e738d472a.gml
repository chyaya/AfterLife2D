if(other == m_OwnerObj)
	return;
	
if(other.m_CurHealth <= 0)
	return;

other.m_CurHealth = other.m_CurHealth - m_Damage;
other.m_CurHealth = clamp(other.m_CurHealth, 0, other.m_MaxHealth);

instance_destroy();
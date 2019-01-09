sPawn_AI_Step();
sPawn_Appearance(self, m_DirX, m_DirY);

if(m_CurHealth == 0 && m_LastHealth > 0 && object_index != oGhost)
{
	event_user(0);
}

m_LastHealth = m_CurHealth;

if(m_DirX != 0 || m_DirY != 0)
{
	direction = sUtil_DirToAngle(m_DirX, m_DirY);
}
event_inherited();

m_DirX = 0;
m_DirY = 0;

if(irandom(1) == 0)
{
	image_xscale = -1;	
}

m_LastHealth = m_CurHealth;

if(m_CurHealth == 0)
	sPawn_Dead();
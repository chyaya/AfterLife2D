m_AI_Control = false;

sPawn_EndPath();

if(m_Rotten == false)
{
	m_RottenNotifySec = -1;
	alarm_set(1, room_speed*15);
}
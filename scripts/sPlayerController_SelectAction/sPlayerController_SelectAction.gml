if(m_player_object.object_index == obj_ghost)
{
	if(m_InteractionObject != noone)
	{
		m_ActionNames[ACTION_A] = "Possess";	
	}
}
else
{
	m_ActionNames[ACTION_A] = "Unpossess";	
}
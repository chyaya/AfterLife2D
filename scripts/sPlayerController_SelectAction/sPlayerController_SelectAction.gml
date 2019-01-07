if(m_player_object.object_index == obj_ghost)
{
	if(m_InteractionObject != noone
		&& object_is_ancestor(m_InteractionObject.object_index, obj_pawn))
	{
		if(m_InteractionObject.m_CurHealth == 0)
		{
			m_ActionNames[ACTION_B] = "Possess";	
		}
	}
}
else
{
	if(m_InteractionObject != noone
		&& object_is_ancestor(m_InteractionObject.object_index, obj_prop))
	{
		m_ActionNames[ACTION_A] = m_InteractionObject.m_ActionName;
	}
	
	m_ActionNames[ACTION_B] = "Unpossess";
}
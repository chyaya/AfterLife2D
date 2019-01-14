if(m_PlayerObject.object_index == oGhost)
{
	if(m_InteractionObject != noone)
	{
		if(m_InteractionObject.object_index == oPileOfCorpses)
		{		
			m_ActionNames[ACTION_B] = "Possess";
		}
		else if(object_is_ancestor(m_InteractionObject.object_index, oPawn))
		{
			if(m_InteractionObject.m_CurHealth == 0
				&& m_InteractionObject.m_Rotten == false)
			{
				m_ActionNames[ACTION_B] = "Possess";	
			}
		}
	}
}
else
{
	if(m_InteractionObject != noone
		&& object_is_ancestor(m_InteractionObject.object_index, oProp))
	{
		m_ActionNames[ACTION_A] = m_InteractionObject.m_ActionName;
	}
	
	m_ActionNames[ACTION_X] = "Attack";
	m_ActionNames[ACTION_B] = "Unpossess";
}
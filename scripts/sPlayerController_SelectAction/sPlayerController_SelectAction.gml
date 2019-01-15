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
			if(m_InteractionObject.m_CurHealth == 0)
			{
				if(m_InteractionObject.m_Rotten == false)
					m_ActionNames[ACTION_B] = "Possess";	
			}
		}
	}
}
else
{
	if(m_InteractionObject != noone)
	{
		if(object_is_ancestor(m_InteractionObject.object_index, oProp))
		{
			m_ActionNames[ACTION_A] = m_InteractionObject.m_ActionName;
		}
		else if(m_InteractionObject.object_index == oItem)
		{
			m_ActionNames[ACTION_A] = "PickUp";
		}
	}
	
	m_ActionNames[ACTION_X] = "Attack";
	m_ActionNames[ACTION_B] = "Unpossess";
	
	with(m_PlayerObject)
	{
		if(global.Item_OnUse[inv[selected]] != noone)
		{
			other.m_ActionNames[ACTION_Y] = "Use";
		}
	}
}
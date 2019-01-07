if(m_Input_Btn_A)
{
	switch(m_ActionNames[ACTION_A])
	{
	case "Possess":
		with(m_player_object)
		{
			instance_destroy();
		}
		m_player_object = m_InteractionObject;
		m_player_object.cur_health = m_player_object.max_health;
		m_player_object.outline_enable = false;
		break;
	case "Unpossess":
		var ghost_obj = instance_create_layer(m_player_object.x, m_player_object.y, "Instances", obj_ghost);
		m_player_object.cur_health = 0;
		m_player_object.outline_enable = false;
		m_player_object = ghost_obj;
		break;
	}
}
if(m_InteractionObject != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fontGUINormal);
	
	var color = c_gray;
	
	var isPawn = object_is_ancestor(m_InteractionObject.object_index, oPawn);
	
	if(isPawn)
	{
		if(m_InteractionObject.m_Rotten)
			color = c_green;
		else if(m_InteractionObject.m_CurHealth  == 0)
			color = c_red;
		else
			color = c_white;
		
		draw_text_color(view_wport[0]/2, view_hport[0]/2 + 300,
			m_InteractionObject.m_Name + "(lv:" + string(m_InteractionObject.m_Level) + ")", color, color, color, color, 1);	
		
		draw_text(view_wport[0]/2, view_hport[0]/2 + 350, "Health:" + string(m_InteractionObject.m_MaxHealth));
		draw_text(view_wport[0]/2, view_hport[0]/2 + 390, "Damage:" + string(m_InteractionObject.m_Damage));
		draw_text(view_wport[0]/2, view_hport[0]/2 + 430, "Speed:" + string(m_InteractionObject.m_MoveSpeed));
		draw_text(view_wport[0]/2, view_hport[0]/2 + 470, "AttackType:" + string(m_InteractionObject.m_AttackType));
	}
	else
	{
		draw_text_color(view_wport[0]/2, view_hport[0]/2 + 300, m_InteractionObject.m_Name, color, color, color, color, 1);	
	}
}
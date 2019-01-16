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
		
		var yPos = view_hport[0]/2 + 250;
		
		draw_text_color(view_wport[0]/2, yPos,
			m_InteractionObject.m_Name + "(lv:" + string(m_InteractionObject.m_Level) + ")", color, color, color, color, 1);	
		yPos += 50;
		
		draw_text(view_wport[0]/2, yPos, "Health:" + string(m_InteractionObject.m_MaxHealth));
		yPos += 40;
		draw_text(view_wport[0]/2, yPos, "Damage:" + string(m_InteractionObject.m_Damage));
		yPos += 40;
		draw_text(view_wport[0]/2, yPos, "Speed:" + string(m_InteractionObject.m_MoveSpeed));
		yPos += 40;
		draw_text(view_wport[0]/2, yPos, "AttackType:" + string(m_InteractionObject.m_AttackType));
		yPos += 40;
		
		with(m_InteractionObject)
		{
			var slotSize = 64;
			var offsetx = other.m_InteractionObject.total_slots*0.5*slotSize;
			sPawn_Inven_DrawUI(view_wport[0]/2-offsetx, yPos, slotSize);
		}
	}
	else
	{
		draw_text_color(view_wport[0]/2, view_hport[0]/2 + 300, m_InteractionObject.m_Name, color, color, color, color, 1);	
	}
}
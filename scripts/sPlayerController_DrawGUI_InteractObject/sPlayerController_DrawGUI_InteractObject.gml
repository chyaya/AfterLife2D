if(m_InteractionObject != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fontGUINormal);
	
	var color = c_gray;
	
	if(object_is_ancestor(m_InteractionObject.object_index, oPawn))
	{
		if(m_InteractionObject.m_Rotten)
			color = c_green;
		else if(m_InteractionObject.m_CurHealth  == 0)
			color = c_red;
		else
			color = c_white;
	}
	
	draw_text_color(view_wport[0]/2, view_hport[0]/2 + 300, m_InteractionObject.m_Name, color, color, color, color, 1);
}
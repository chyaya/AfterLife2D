// Inherit the parent event
event_inherited();

#macro BAR_HEIGHT 1

if(m_CurHealth > 0 && m_CurHealth < m_MaxHealth)
{
	var barX = x - sprite_width/2;
	var barY = y - (sprite_height/2 + 3);
	
	draw_set_colour(c_white);
	draw_rectangle(barX, barY, barX + sprite_width, barY + BAR_HEIGHT, false);
	
	draw_set_colour(c_red);
	
	var healthRate = clamp(m_CurHealth/m_MaxHealth, 0.0, 1.0);
	
	if(healthRate > 0)
		draw_rectangle(barX, barY, barX + sprite_width*healthRate, barY + BAR_HEIGHT, false);
}
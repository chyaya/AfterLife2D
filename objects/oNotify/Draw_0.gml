draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fontNormal);
draw_text_color(x + m_OffsetX + m_CurX, y + m_OffsetY + m_CurY, m_Text,
	c_white, c_white, c_white, c_white, m_CurAlpha);
	
var seconds_passed = delta_time/1000000;
m_CurX += seconds_passed*m_VX;
m_CurY += seconds_passed*m_VY;
m_CurAlpha -= seconds_passed*.5;

if(m_CurAlpha <= 0)
	instance_destroy();
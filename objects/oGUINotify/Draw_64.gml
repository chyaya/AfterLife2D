draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fontFixedsys);
draw_text_color(view_wport[0]/2 + m_OffsetX, view_hport[0]/2 + m_OffsetY + m_CurY, m_Text,
	c_white, c_white, c_white, c_white, m_CurAlpha);
	
var seconds_passed = delta_time/1000000;
m_CurY -= seconds_passed*100;
m_CurAlpha -= seconds_passed;

if(m_CurAlpha <= 0)
	instance_destroy();
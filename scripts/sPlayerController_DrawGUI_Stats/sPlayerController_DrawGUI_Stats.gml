
draw_set_colour(c_white);
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fontGUINormal);

var text_x = 10, text_y = 10;
var line_h = 40, offset = 250;

if(m_PlayerObject.object_index != oGhost)
{
	draw_text(text_x, text_y, "Level:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_Level));
	text_y += line_h;
	
	draw_text(text_x, text_y, "Health:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_CurHealth) + "/" + string(m_PlayerObject.m_MaxHealth));
	text_y += line_h;
	
	draw_text(text_x, text_y, "Damage:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_Damage));
	text_y += line_h;
	
	draw_text(text_x, text_y, "Speed:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_MoveSpeed));
	text_y += line_h;
	
	draw_text(text_x, text_y, "AttackType:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_AttackType));
	text_y += line_h;
}

var soulTextColor = c_white;

if(m_CurSoulPoint <= m_UnpossessCost)
{
	soulTextColor = current_second % 2 ? c_white : c_red;
}

text_x = view_wport[0] - 420;
text_y = 10;
draw_text_color(text_x, text_y, "Soul:",
	soulTextColor, soulTextColor, soulTextColor, soulTextColor, 1);
draw_text_color(text_x + offset, text_y, string(m_CurSoulPoint) + "/" + string(m_MaxSoulPoint),
	soulTextColor, soulTextColor, soulTextColor, soulTextColor, 1);
text_y += line_h;
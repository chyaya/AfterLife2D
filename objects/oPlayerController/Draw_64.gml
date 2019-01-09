if(m_PlayerObject.object_index == oGhost)
{
	draw_set_colour(c_aqua);
	draw_set_alpha(0.2);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false);
}

draw_set_colour(c_white);
draw_set_alpha(1.0);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_font(fontFixedsys);

var text_x = 10, text_y = 10;
var line_h = 40, offset = 200;

if(m_PlayerObject.object_index != oGhost)
{
	draw_text(text_x, text_y, "Health:");
	draw_text(text_x + offset, text_y,
		string(m_PlayerObject.m_CurHealth) + "/" + string(m_PlayerObject.m_MaxHealth));
	text_y += line_h;

	//draw_text(text_x, text_y, "Stamina:");
	//draw_text(text_x + offset, text_y,
	//	string(m_PlayerObject.m_CurHealth) + "/" + string(m_PlayerObject.m_MaxHealth));
	//text_y += line_h;
}

var soulTextColor = c_white;

if(m_CurSoulPoint <= m_UnpossessCost)
{
	soulTextColor = current_second % 2 ? c_white : c_red;
}

text_x = view_wport[0] - 400;
text_y = 10;
draw_text_color(text_x, text_y, "Soul:",
	soulTextColor, soulTextColor, soulTextColor, soulTextColor, 1);
draw_text_color(text_x + offset, text_y, string(m_CurSoulPoint) + "/" + string(m_MaxSoulPoint),
	soulTextColor, soulTextColor, soulTextColor, soulTextColor, 1);
text_y += line_h;


#macro BUTTON_SIZE		48
#macro TEXT_SIZE		32
#macro TEXT_GAP			15
#macro TEXT_OFFSET_Y	(BUTTON_SIZE - TEXT_SIZE)/2

var pad_x = view_wport[0] - 400, pad_y = view_hport[0] - 400;
draw_sprite_stretched(sprGUI_GamepadY, -1, pad_x + 50, pad_y, BUTTON_SIZE, BUTTON_SIZE);
draw_set_halign(fa_right);
draw_text(pad_x + 50 - TEXT_GAP, pad_y + TEXT_OFFSET_Y, m_ActionNames[ACTION_Y]);

draw_sprite_stretched(sprGUI_GamepadX, -1, pad_x, pad_y + 50, BUTTON_SIZE, BUTTON_SIZE);
draw_set_halign(fa_right);
draw_text(pad_x - TEXT_GAP, pad_y + 50 + TEXT_OFFSET_Y, m_ActionNames[ACTION_X]);

draw_sprite_stretched(sprGUI_GamepadA, -1, pad_x + 50, pad_y + 100, BUTTON_SIZE, BUTTON_SIZE);
draw_set_halign(fa_left);
draw_text(pad_x + 50 + BUTTON_SIZE + TEXT_GAP, pad_y + 100 + TEXT_OFFSET_Y, m_ActionNames[ACTION_A]);

draw_sprite_stretched(sprGUI_GamepadB, -1, pad_x + 100, pad_y + 50, BUTTON_SIZE, BUTTON_SIZE);
draw_set_halign(fa_left);
draw_text(pad_x + 100 + BUTTON_SIZE + TEXT_GAP, pad_y + 50 + TEXT_OFFSET_Y, m_ActionNames[ACTION_B]);

//pad_x = 300;
//pad_y = view_hport[0] - 400;
//draw_sprite_stretched(spr_gui_dpad_up, -1, pad_x + 50, pad_y, 48, 48);
//draw_sprite_stretched(spr_gui_dpad_left, -1, pad_x, pad_y + 50, 48, 48);
//draw_sprite_stretched(spr_gui_dpad_down, -1, pad_x + 50, pad_y + 100, 48, 48);
//draw_sprite_stretched(spr_gui_dpad_right, -1, pad_x + 100, pad_y + 50, 48, 48);

if(m_InteractionObject != noone)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fontFixedsys);
	
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



if(m_GameOver)
{
	draw_set_colour(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0, 0, view_wport[0], view_hport[0], false);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_font(fontGameOver);
	draw_text_color(view_wport[0]/2, view_hport[0]/2, "You Die", c_red, c_red, c_black, c_black, 1);
}
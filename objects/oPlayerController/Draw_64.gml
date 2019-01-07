draw_set_halign(fa_left);
draw_set_font(font_fixedsys);

var text_x = 10, text_y = 10;
var line_h = 40, offset = 200;

draw_text(text_x, text_y, "Health:");
draw_text(text_x + offset, text_y, "100/100");
text_y += line_h;

draw_text(text_x, text_y, "Stamina:");
draw_text(text_x + offset, text_y, "100/100");
text_y += line_h;

text_x = view_wport[0] - 400;
text_y = 10;
draw_text(text_x, text_y, "Soul:");
draw_text(text_x + offset, text_y, "100/100");
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
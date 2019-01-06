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


var pad_x = view_wport[0] - 400, pad_y = view_hport[0] - 400;
draw_sprite_stretched(spr_gui_gamepad_y, -1, pad_x + 50, pad_y, 48, 48);
draw_sprite_stretched(spr_gui_gamepad_x, -1, pad_x, pad_y + 50, 48, 48);
draw_sprite_stretched(spr_gui_gamepad_a, -1, pad_x + 50, pad_y + 100, 48, 48);
draw_sprite_stretched(spr_gui_gamepad_b, -1, pad_x + 100, pad_y + 50, 48, 48);

pad_x = 300;
pad_y = view_hport[0] - 400;
draw_sprite_stretched(spr_gui_dpad_up, -1, pad_x + 50, pad_y, 48, 48);
draw_sprite_stretched(spr_gui_dpad_left, -1, pad_x, pad_y + 50, 48, 48);
draw_sprite_stretched(spr_gui_dpad_down, -1, pad_x + 50, pad_y + 100, 48, 48);
draw_sprite_stretched(spr_gui_dpad_right, -1, pad_x + 100, pad_y + 50, 48, 48);
/// @description Insert description here
// You can write your code in this editor

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
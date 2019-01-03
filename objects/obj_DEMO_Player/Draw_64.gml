/// @description

// Demo code. Can be removed...
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 256, 96, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text(8, 16, string_hash_to_newline("Use left mouse button to move around#and right mouse button to zoom in/out.##Press <SPACE> to regenerate#Press <ENTER> to go to the initial room again"));
draw_set_colour(c_black);

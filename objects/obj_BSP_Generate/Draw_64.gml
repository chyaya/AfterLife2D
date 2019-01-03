/// @description

//This is extra info for the DEMO only and can be removed
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 256, 64, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text(8, 16, string_hash_to_newline("MAZE GENERATED!#Press <SPACE> to regenerate#Press <ENTER> to go to the initial room again"));
draw_set_colour(c_black);


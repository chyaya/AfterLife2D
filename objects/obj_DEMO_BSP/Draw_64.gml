/// @description

// Demo code. Can be removed...
draw_set_colour(c_black);
draw_set_alpha(0.5);
draw_rectangle(0, 0, 256, 96, false);
draw_set_alpha(1);
draw_set_colour(c_white);
draw_set_halign(fa_left);
draw_text(8, 16, string_hash_to_newline("MAZE GENERATING! Click the mouse to step#through the generation and then play.##Press <SPACE> ro regenerate#Press <ENTER> to go to the initial room again"));
draw_set_colour(c_black);
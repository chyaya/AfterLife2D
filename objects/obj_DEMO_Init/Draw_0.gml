// Draw the buttons for this demo
draw_set_halign(fa_center);
draw_set_colour(c_black);

// room width
draw_sprite(spr_DEMO_Arrow, 0, 32, 32)
draw_text(32, 60, string_hash_to_newline(string(rm_w)));
draw_sprite(spr_DEMO_Arrow, 1, 32, 96);
draw_text(32, 112, string_hash_to_newline("Room#Width"));

// room height
draw_sprite(spr_DEMO_Arrow, 0, 96, 32)
draw_text(96, 60, string_hash_to_newline(string(rm_h)));
draw_sprite(spr_DEMO_Arrow, 1, 96, 96);
draw_text(96, 112, string_hash_to_newline("Room#Height"));

// number of room splits
draw_sprite(spr_DEMO_Arrow, 0, 160, 32)
draw_text(160, 60, string_hash_to_newline(string(global.splitNum)));
draw_sprite(spr_DEMO_Arrow, 1, 160, 96);
draw_text(160, 112, string_hash_to_newline("Split#Number"));

// minimum split size
draw_sprite(spr_DEMO_Arrow, 0, 224, 32)
draw_text(224, 60, string_hash_to_newline(string(global.splitSize)));
draw_sprite(spr_DEMO_Arrow, 1, 224, 96);
draw_text(224, 112, string_hash_to_newline("Split#Size"));

// number of rooms to skip
draw_sprite(spr_DEMO_Arrow, 0, 288, 32)
draw_text(288, 60, string_hash_to_newline(string(global.roomSkip)));
draw_sprite(spr_DEMO_Arrow, 1, 288, 96);
draw_text(288, 112, string_hash_to_newline("Room#Skip"));

// tile size
draw_sprite(spr_DEMO_Arrow, 0, 352, 32)
draw_text(352, 60, string_hash_to_newline(string(global.cellSize)));
draw_sprite(spr_DEMO_Arrow, 1, 352, 96);
draw_text(352, 112, string_hash_to_newline("Tile#Size"));

// mesage text
draw_text_transformed(room_width / 2, room_height / 2, string_hash_to_newline(@"
Welcome to the BSP random map generator!##
Use the buttons shown above to prepare your#
map variables then press one of the following:##
<ENTER> to generate a BSP grid map.#
<BACKSPACE> to generate a playable maze."), 2, 2, 0);



draw_set_font(fnt_FOW);
draw_set_colour(c_white);

switch(room)
{
case rm_FOW_Light: draw_text(32, 32, string_hash_to_newline(@"In this room we simulate a light source.
Use the Mouse Wheel to change the radius.
Press ENTER to switch lighting type (Quadratic/linear).
Press SPACE to change room:"));
break;
case rm_FOW_Normal: draw_text(32, 32, string_hash_to_newline(@"In this room we have the basic Tiled Fog Of War effect.
Use the Mouse Wheel to change the radius.
Press ENTER to switch lighting type (Quadratic/linear).
Press SPACE to change room:"));
break;
case rm_FOW_Views: draw_text(32, 32, string_hash_to_newline(@"In this room we use a smaller tile size and views.
Use the Mouse Wheel to change the radius.
Press ENTER to switch lighting type (Quadratic/linear).
Press SPACE to change room:"));
break;
}


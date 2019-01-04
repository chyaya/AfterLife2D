// This is the controller for the FOW.
// Drop this into a room, or simply use the script 
// in the CREATE EVENT of any other controller.

// See the script for an explanation of the arguments.

switch(room)
{
case rm_FOW_Normal: scr_FOW_Init(-1000, 32, room_width, room_height, false, 1); break;
case rm_FOW_Light: scr_FOW_Init(-1000, 32, room_width, room_height, true, 0.8); break;
case rm_FOW_Views: scr_FOW_Init(-1000, 32, room_width, room_height, false, 1); break;
}






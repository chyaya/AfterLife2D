/// @function		scr_BSP_Populate_Rooms(object, num, room_count, player_room, cell_size, equal_split, snap, layer);
/// @param {index}	object			The object to spawn
/// @param {int}	num				The number of instances of the object to spawn
/// @param {int}	room_count		The number of sub-room areas created (held in the BSP controller "count" variable)
/// @param {int}	player_room		The player sub-room, use -1 if you don't want the player room excluded
/// @param {int}	cell_size		The cell size to use (also held in the controller as an instance variable "cell_size")
/// @param {bool}	equal_split		Split the spawns equally in all room areas (Ideal for spawning chests etc...)
/// @param {bool}	snap			Switch on/off grid snapping
/// @param {string}	layer			The layer ID of the layer to spawn on


/// @description	This script is used for populating EVERY room area in the game room.
///					It can be customised to omit the player room, as well as to divide the 
///					instances spawned either equally per room, or randomly over all rooms.
///
///					Should you need more control over the spawns, you should use the script
///					"scr_BSP_Populate_Area()", as that permits you to choose the sub-room area
///					to spawn the items in on an individual basis.


// Initialise local vars....
var obj = argument0;
var num = argument1;
var rmc = argument2;
var pps = argument3;
var tts = argument4;
var equ = argument5;
var snp = argument6;
var lay = argument7;

var spn = tts / 2;
var spr = object_get_sprite(obj);

sprite_index = spr;

// Check for equal distribution or not....
if equ
{
var rm_split = num / rmc;                   // Get the number to split into each room
var i, j, xx, yy, ww, hh;                   // More local vars
for (i = 0; i < rmc; i++;)
    {
    if i != pps                             // Check to see if the player room should be skipped
        {
        repeat(rm_split)
            {
            xx = (r[i, 0] + 2) * tts;       // Get the start x position of the room, adding two to compensate for the room walls
            yy = (r[i, 1] + 2) * tts;       // Get the starting y for the room
            if snp
                {
                ww = irandom(r[i, 2]) * tts;    // Get the room width snapped to the grid
                hh = irandom(r[i, 3]) * tts;    // Get the room height snapped to the grid
                }
            else
                {
                ww = irandom(r[i, 2] * tts);    // Get the room width
                hh = irandom(r[i, 3] * tts);    // Get the room height
                }
            j = 0;                          // Counter variable to prevent infinite loops
            // Now check the positions for a collision with any other child of the collision parent to prevent over-lapping
            while (place_meeting(xx + ww - spn, yy + hh - spn, obj_BSP_Collision_Parent) && j < 10)
                {
                // We increment the count var to prevent infinite loops
                j++;
                // Reset the random position
                var xx = (r[i, 0] + 2) * tts;
                var yy = (r[i, 1] + 2) * tts;
                if snp
                    {
                    ww = irandom(r[i, 2]) * tts;    // Get the room width snapped to the grid
                    hh = irandom(r[i, 3]) * tts;    // Get the room height snapped to the grid
                    }
                else
                    {
                    ww = random(r[i, 2] * tts);    // Get the room width
                    hh = random(r[i, 3] * tts);    // Get the room height
                    }
                }
            // The counter hasn't timed out so create an enemy.
            if j < 10 instance_create_layer(xx + ww - spn, yy + hh - spn, lay, obj);
            }
        }
    }
}
else
{
var j, e_pos, xx, yy, ww, hh;                           // Initialise some local vars
for (var i = 0; i < num; i++;)
    {
    e_pos = irandom(rmc - 1);                           // Room to spawn enemies in
    if pps != -1                                        // Check if the player room is to be skipped
        {
        while (e_pos == pps) e_pos = irandom(rmc - 1);  // Make sure it is not the player room (remove if not required!)
        }
    xx = (r[e_pos, 0] + 2) * tts;                       // Get the start x position of the room, adding two to compensate for the room walls
    yy = (r[e_pos, 1] + 2) * tts;                       // Get the starting y for the room
    if snp                                              // Check for grid snapping
        {
        ww = irandom(r[e_pos, 2]) * tts;    // Get the room width snapped to the grid
        hh = irandom(r[e_pos, 3]) * tts;    // Get the room height snapped to the grid
        }
    else
        {
        ww = irandom(r[e_pos, 2] * tts);    // Get the room width
        hh = irandom(r[e_pos, 3] * tts);    // Get the room height
        }
    j = 0;                                  // Counter variable to prevent infinite loops
    // Now check the positions for a collision with an enemy so as to prevent over-lapping
    while (place_meeting(xx + ww - spn, yy + hh - spn, obj_BSP_Collision_Parent) && j < 10)
        {
        // We increment the count var to prevent infinite loops
        j++;
        // Reset the random position
        var xx = (r[e_pos, 0] + 2) * tts;
        var yy = (r[e_pos, 1] + 2) * tts;
        if snp
            {
            ww = irandom(r[e_pos, 2]) * tts;    // Get the room width snapped to the grid
            hh = irandom(r[e_pos, 3]) * tts;    // Get the room height snapped to the grid
            }
        else
            {
            ww = irandom(r[e_pos, 2] * tts);    // Get the room width
            hh = irandom(r[e_pos, 3] * tts);    // Get the room height
            }
        }
    // The counter hasn't timed out so create an enemy.
    if j < 10 instance_create_layer(xx + ww - spn, yy + hh - spn, lay, obj);
    }
}

sprite_index = -1;

/// @function		scr_BSP_Populate_Area(object, num, room_num, cell_size, snap, layer);
/// @param {index}	object		The Object to spawn
/// @param {int}	num			The number of instances of the object to spawn
/// @param {int}	room_num	The room number to spawn into
/// @param {int}	cell_size	The tile size to use (also held in the controller as an instance variable "cell_size")
/// @param {bool}	snap		Switch on/off grid snapping
/// @param {string}	layer		The layer ID of the layer to spawn on

/// @description	This script is used for populating a single sub-room area in the game room.
///					It works using the sprite index of the instance to be spawned, so ensure that 
///					instance has a sprite and it is the correct one before using it.

// Initialise local vars....
var obj = argument0;
var num = argument1;
var rmn = argument2;
var tts = argument3;
var snp = argument4;
var lay = argument5;

var spn = tts / 2;
var spr = object_get_sprite(obj);

sprite_index = spr;

var j, xx, yy, ww, hh;                // More local vars
repeat(num)
{
xx = (r[rmn, 0] + 2) * tts;           // Get the start x position of the room, adding two to compensate for the room walls
yy = (r[rmn, 1] + 2) * tts;           // Get the starting y for the room
if snp                                // Check for grid snapping
    {
    ww = irandom(r[rmn, 2]) * tts;    // Get the room width snapped to the grid
    hh = irandom(r[rmn, 3]) * tts;    // Get the room height snapped to the grid
    }
else
    {
    ww = irandom(r[rmn, 2] * tts);    // Get the room width
    hh = irandom(r[rmn, 3] * tts);    // Get the room height
    }
j = 0;                                // Counter variable to prevent infinite loops
// Now check the positions for a collision with any other child of the collision parent to prevent over-lapping
while (place_meeting(xx + ww - spn, yy + hh - spn, obj_BSP_Collision_Parent) && j < 10)
    {
    // We increment the count var to prevent infinite loops
    j++;
    // Reset the random position
    var xx = (r[rmn, 0] + 2) * tts;
    var yy = (r[rmn, 1] + 2) * tts;
    if snp
        {
        ww = irandom(r[rmn, 2]) * tts;
        hh = irandom(r[rmn, 3]) * tts;
        }
    else
        {
        ww = random(r[rmn, 2] * tts);
        hh = random(r[rmn, 3] * tts);
        }
    }
// The counter hasn't timed out so create an instance.
if j < 10 instance_create_layer(xx + ww - spn, yy + hh - spn, lay, obj);
}

sprite_index = -1;

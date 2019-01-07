/// @description  sFOW_Init(depth, tile_size, width, height, light, alpha);
/// @param depth
/// @param  tile_size
/// @param  width
/// @param  height
/// @param  light
/// @param  alpha

// Initialise some global variables and create the tile overlay.
// Note that these global variables are not strictly necessary and 
// could be changed for instance variables. You could even have all 
// the scripts in a single object (like the player) and do away with 
// the need for a controller. However for clarity and ease of use
// I have done things this way.

global.FOW_Depth = argument0;                               // FOW tile depth
global.FOW_TSize = argument1;                               // FOW tile size (must be square, from 8x8 up to 256x256)
global.FOW_AreaW = floor(argument2 / global.FOW_TSize);     // Width in tiles of the room area to fog
global.FOW_AreaH = floor(argument3 / global.FOW_TSize);     // Height in tiles of the room area to fog
global.FOW_Light = argument4;                               // Set the effect to act like a FOW or like a light
global.FOW_Alpha = argument5;                               // Base alpha for the FOW.

// Initialise the arry in memory if NOT using the HTML5 target
if os_browser == browser_not_a_browser
{
	global.FOW[global.FOW_AreaW, global.FOW_AreaH] = 0;
}

// Add the tiles to the area defined
for (var i = 0; i < global.FOW_AreaW; i++;)
{
	for (var j = 0; j < global.FOW_AreaH; j++;)
    {
	    global.FOW[i, j] = tile_add(bck_FOW_Tile, 4, 4, global.FOW_TSize, global.FOW_TSize, i * global.FOW_TSize, j * global.FOW_TSize,  global.FOW_Depth);
	    tile_set_alpha(global.FOW[i, j], global.FOW_Alpha);
    }
} 
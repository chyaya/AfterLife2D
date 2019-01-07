/// @description  scr_FOW_Update(x, y, solid_object);
/// @param x
/// @param  y
/// @param  solid_object

// Prepare vars

var ts = global.FOW_TSize;          // Tile size
var xx = floor(argument0 / ts);     // X position within the tile array
var yy = floor(argument1 / ts);     // Y position within the tile array

// Before going any further, check that the instance has actually moved 
// and is no longer within the previous tile grid position.
if FOW_Xprev != xx || FOW_Yprev != yy || FOW_Dirty
{
var al = global.FOW_Alpha;
var ar = global.FOW;
var rr = FOW_Radius;                // Radius of the fog area to show
var dd = rr * 2;                    // Diameter of the fog area to show
var ob = argument2;                 // object to consider as "blocker"

var tx = max(0, (xx - rr) - global.FOW_Light);                       // Keep the lower(x, y) bounds in the room
var ty = max(0, (yy - rr) - global.FOW_Light);

var max_x = min(global.FOW_AreaW, tx + dd + (global.FOW_Light * 2)); // Keep the upper (x, y) bounds in room
var max_y = min(global.FOW_AreaH, ty + dd + (global.FOW_Light * 2));

var tile, pd, pdir, t_alpha, inst;                                   // More temp vars!!!

// Loop through the area of the tile array that corresponds to the "show" area
for (var i = tx; i < max_x;  i++;)
    {
    for (var j = ty; j < max_y; j++;)
        {
        tile = ar[i, j];
        if tile_exists(tile)
            {
            // If we have choosen to enable FOW lighting, set the tile alpha to 1 
            // before calculating the actual alpha around the position.
            if global.FOW_Light
                {
                tile_set_alpha(tile, al);
                }
            // Is the tile in range?
            if point_in_circle(i, j, xx, yy, rr)
                {
                // Get tile info
                t_alpha = tile_get_alpha(tile);
                // Tile alpha is greater than zero so keep checking
                if t_alpha > 0
				{
                    // Get distance from tile to center (in array values)
                    pd = point_distance(i, j, xx, yy) / rr;
                    // Make the distance quadratic to give a better un-cover area
                    if FOW_Quad
					{
						pd = pd * pd * pd;
					}
					
                    // Check to see if the position changes the alpha value
                    if pd < t_alpha
                    {
                        // Check for blockers
                        if(scr_FOW_Bresenhams(xx, yy, i, j, ob, ts) == false)
						{
                            // no blocker found so set tile alpha
                            tile_set_alpha(tile, pd);
						}
                        else
						{
							if(sUtil_IsBlocked((i * ts), (j * ts), ts, true))
							{
								if !scr_FOW_Bresenhams(i, j, xx, yy, ob, ts)
								{
									tile_set_alpha(tile, pd);
								}
							}
						}
					}
				}
                else
                    {
                    // Minor optimisation. Remove tiles with zero alpha.
                    if !global.FOW_Light tile_delete(tile);
                    }
                }
            }
        }
    }
FOW_Xprev = xx;
FOW_Yprev = yy;
FOW_Dirty = false
}
        
        
        
        
        

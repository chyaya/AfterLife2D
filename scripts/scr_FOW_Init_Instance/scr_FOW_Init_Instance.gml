/// @description  scr_FOW_Init_Instance(radius, x, y, quadratic);
/// @param radius
/// @param  x
/// @param  y
/// @param  quadratic

FOW_Radius = argument0;     // Base radius of the "light"
FOW_Xprev = argument1;      // Previous x position in the FOW array
FOW_Yprev = argument2;      // Previous y position in the FOW array
FOW_Quad = argument3;       // Use quadratic lighting (looks nicer - linear only looks good really on grid-snapped games)
FOW_Dirty = false;

// NOTE! The radius value, along with the tile size that you set,
// will have a SERIOUS impact on performance! While these scripts are
// as optimised as possible, they still require a double "for" loop to go 
// through the tiles and set their alpha while doing collision
// checks. So, change the radius and tile size to get a balance between 
// what looks good and what gives good performance.
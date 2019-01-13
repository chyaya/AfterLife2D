var width = room_width / cellSize;
var height = room_height / cellSize;

cells = ds_grid_create(width, height);


var _l = layer_get_id("Tiles");
var _m = layer_tilemap_get_id(_l); // Uncomment for tiles!

for (var i = 0; i < width; i++;)
{
	for (var j = 0; j < height; j++;)
    {
		var _t = tilemap_get(_m, i, j);
		
		if(_t == 24)
		{
			aStar_set_blocked(i, j, true);
		}
	}
}
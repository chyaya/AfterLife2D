var ar = global.FOW;
var ts = global.FOW_TSize;
var alpha = tile_get_alpha(ar[x/ts, y/ts]);
return alpha < 1;
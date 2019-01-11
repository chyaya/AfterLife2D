cellSize = 16;

var width = room_width / cellSize;
var height = room_height / cellSize;

cells = ds_grid_create(width, height);
cuttingCorners = true;
cuttingBlockedCorners = false;

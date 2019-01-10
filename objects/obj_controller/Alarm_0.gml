//Get a path from player position to mouse position. This path will then be drawn

var cellSize = aStar_get_cell_size();
path = aStar_find_path(aStar_get_cell_coordinate(obj_player.x), 
                       aStar_get_cell_coordinate(obj_player.y), 
                       aStar_get_cell_coordinate(mouse_x),
                       aStar_get_cell_coordinate(mouse_y));

alarm[0] = room_speed / 10;


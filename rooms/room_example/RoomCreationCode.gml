var cellSize = 64;
aStar_init(room_width / cellSize, room_height / cellSize, cellSize, true, false);
randomize();
instance_create(0, 0, obj_controller);
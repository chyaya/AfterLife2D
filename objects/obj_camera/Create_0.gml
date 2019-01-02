camera = camera_create();

zoom = 4.0;
zoom_speed = 1.1;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0]/zoom, view_hport[0]/zoom, 1, 10000);

camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

view_camera[0] = camera;

follow = obj_player;

xTo = x;
yTo = y;
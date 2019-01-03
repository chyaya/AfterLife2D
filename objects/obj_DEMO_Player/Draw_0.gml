var _vx = x - (camera_get_view_width(view_camera[0]) / 2);
var _vy = y - (camera_get_view_height(view_camera[0]) / 2);

camera_set_view_pos(view_camera[0], _vx, _vy);

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, ang, c_white, 1);

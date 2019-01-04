x += (xTo - x)/25;
y += (yTo - y)/25;

follow = obj_player_controller.m_player_object;

if(follow != noone)
{
	xTo = follow.x;
	yTo = follow.y;
}
else
{
	
}


var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(camera, vm);

if(mouse_wheel_down())
{
	zoom /= zoom_speed;
}

if(mouse_wheel_up())
{
	zoom *= zoom_speed;
}

	
if(last_zoom != zoom)
{
	var pm = matrix_build_projection_ortho(view_wport[0]/zoom, view_hport[0]/zoom, 1, 10000);
	camera_set_proj_mat(camera, pm);
}

last_zoom = zoom;
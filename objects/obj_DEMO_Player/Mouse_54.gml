if view_enabled
{
view_enabled = false;
surface_resize(application_surface, room_width, room_height);
}
else
{
//Set the view
var ratio = room_height / room_width;
if ratio >= 1
    {
	camera_set_view_size(view_camera[0], 240 / ratio, 240);
    }
else
    {
	camera_set_view_size(view_camera[0], 320, 320 * ratio);
    }
view_enabled = true;
view_visible[0] = true;
view_wport[0] = window_get_width();
view_hport[0] = window_get_height();
var _vw = camera_get_view_width(view_camera[0]);
var _vh = camera_get_view_height(view_camera[0]);
surface_resize(application_surface, _vw, _vh);
}


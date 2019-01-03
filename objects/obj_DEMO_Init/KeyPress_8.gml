// Set the room width and height for the next room
// and resize the window and app surface to suit

room_set_width(rm_Test, rm_w);
room_set_height(rm_Test, rm_h);
var ratio = rm_h / rm_w;
if ratio >= 1
{
window_set_size(768 / ratio, 768);
}
else
{
window_set_size(1024, 1024 * ratio);
}
surface_resize(application_surface, rm_w, rm_h);
room_goto(rm_Test);


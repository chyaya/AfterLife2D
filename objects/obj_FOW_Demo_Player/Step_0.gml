event_inherited();

if place_snapped(32, 32)
{
speed = 0;
image_speed = 0;
var xx = (keyboard_check(vk_right) - keyboard_check(vk_left));
var yy = (keyboard_check(vk_down) - keyboard_check(vk_up));
var pd = point_direction(0, 0, xx, yy);
if !place_meeting(x + (xx * 32), y + (yy * 32), obj_FOW_Wall_Parent)
    {
    if ((xx != 0) || (yy != 0))
        {
        ang = pd;
        hspeed = xx * 4;
        vspeed = yy * 4;
        image_speed = 0.5;
        }
    }
}


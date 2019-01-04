#macro AXIS_THRESHOLD 0.25

if(gamepad_get_device_count() > 0)
{
	if(gamepad_axis_value(0, gp_axislv) < -AXIS_THRESHOLD)
	{
		yDir -= 1;
	}
	else if(gamepad_axis_value(0, gp_axislv) > AXIS_THRESHOLD)
	{
		yDir += 1;
	}
	
	if(gamepad_axis_value(0, gp_axislh) < -AXIS_THRESHOLD)
	{
		xDir -= 1;
	}
	else if(gamepad_axis_value(0, gp_axislh) > AXIS_THRESHOLD)
	{
		xDir += 1;
	}
	
	if(gamepad_button_check_pressed(0, gp_start))
	{
		game_restart();	
	}
	
	
	if(gamepad_button_check_pressed(0, gp_select))
	{
		other.gamepad_zoom = !other.gamepad_zoom;
		
		if(other.gamepad_zoom)
		{
			obj_camera.zoom = 1.0;
		}
		else
		{
			obj_camera.zoom = 4.0;
		}
	}
	
}
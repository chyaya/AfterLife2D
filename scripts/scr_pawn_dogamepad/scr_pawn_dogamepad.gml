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
}
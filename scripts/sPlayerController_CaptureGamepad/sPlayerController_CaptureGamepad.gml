#macro AXIS_THRESHOLD 0.25

if(gamepad_get_device_count() > 0)
{
	if(m_GameOver == false)
	{
		if(gamepad_axis_value(0, gp_axislv) < -AXIS_THRESHOLD || gamepad_button_check(0, gp_padu))
		{
			m_Input_AxisL_Up = true;
		}
		else if(gamepad_axis_value(0, gp_axislv) > AXIS_THRESHOLD || gamepad_button_check(0, gp_padd))
		{
			m_Input_AxisL_Down = true;
		}
	
		if(gamepad_axis_value(0, gp_axislh) < -AXIS_THRESHOLD || gamepad_button_check(0, gp_padl))
		{
			m_Input_AxisL_Left = true;
		}
		else if(gamepad_axis_value(0, gp_axislh) > AXIS_THRESHOLD || gamepad_button_check(0, gp_padr))
		{
			m_Input_AxisL_Right = true;
		}
	
		if(gamepad_button_check_pressed(0, gp_face1))
		{
			m_Input_Btn_A	= true;
		}
	
		if(gamepad_button_check_pressed(0, gp_face2))
		{
			m_Input_Btn_B	= true;
		}
	
		if(gamepad_button_check_pressed(0, gp_face3))
		{
			m_Input_Btn_X	= true;
		}
	
		if(gamepad_button_check_pressed(0, gp_face4))
		{
			m_Input_Btn_Y	= true;
		}
	}
	
	if(gamepad_button_check_pressed(0, gp_start))
	{
		m_Input_Btn_Start = true;
	}
	
	if(gamepad_button_check_pressed(0, gp_select))
	{
		m_Input_Btn_Select = true;
	}
	
}
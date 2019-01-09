
if(m_GameOver == false)
{
	if(keyboard_check(ord("W")))
	{
		m_Input_AxisL_Up = true;
	}

	if(keyboard_check(ord("S")))
	{
		m_Input_AxisL_Down = true;
	}

	if(keyboard_check(ord("A")))
	{
		m_Input_AxisL_Left = true;
	}

	if(keyboard_check(ord("D")))
	{
		m_Input_AxisL_Right = true;
	}

	if(keyboard_check_pressed(vk_up))
	{
		m_Input_Btn_Y = true;	
	}

	if(keyboard_check_pressed(vk_down))
	{
		m_Input_Btn_A = true;	
	}

	if(keyboard_check_pressed(vk_left))
	{
		m_Input_Btn_X = true;	
	}

	if(keyboard_check_pressed(vk_right))
	{
		m_Input_Btn_B = true;	
	}
}

if(keyboard_check_pressed(vk_enter))
{
	m_Input_Btn_Start = true;	
}

if(keyboard_check_pressed(vk_backspace))
{
	m_Input_Btn_Select = true;	
}
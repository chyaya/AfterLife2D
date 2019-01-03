with(m_player_object)
{
	var seconds_passed = delta_time/1000000;
	var move_speed_this_frame = move_speed*seconds_passed;

	//////////////////////////////////////////////////////////
	// Move Input
	var last_x = x, last_y = y;

	if(keyboard_check(ord("W")))
	{
		y -= move_speed_this_frame;
	}

	if(keyboard_check(ord("S")))
	{
		y += move_speed_this_frame;
	}

	if(keyboard_check(ord("A")))
	{
		x -= move_speed_this_frame;
	}

	if(keyboard_check(ord("D")))
	{
		x += move_speed_this_frame;
	}

	xDir = x - last_x;
	yDir = y - last_y;

	//////////////////////////////////////////////////////////
	// Ability Input
	
	if(object_index != obj_ghost)
	{
		if(mouse_check_button_pressed(mb_left))
		{
			if(ability1 != noone)
				script_execute(ability1);
		}
	}
}

var last_mouseover_object = m_mouseover_object;

if(last_mouseover_object == m_player_object)
{
	last_mouseover_object = noone;
}

m_mouseover_object = instance_position( mouse_x, mouse_y, all);

if(m_mouseover_object == m_player_object)
{
	m_mouseover_object = noone;
}

if(last_mouseover_object != m_mouseover_object)
{
	if(last_mouseover_object != noone)
	{
		last_mouseover_object.outline_enable = false;
	}
	
	if(m_mouseover_object != noone)
	{
		m_mouseover_object.outline_enable = true;
		m_mouseover_object.outline_color = c_white;
	}
	
}

if(m_player_object.object_index == obj_ghost)
{
	if(mouse_check_button_pressed(mb_left))
	{
		if(m_mouseover_object != noone)
		{
			with(m_player_object)
			{
				instance_destroy();
			}
			
			m_player_object = m_mouseover_object;
			m_player_object.cur_health = m_player_object.max_health;
			m_player_object.outline_enable = false;
			//m_player_object.outline_color = c_blue;
		}
	}
}
else
{
	if(keyboard_check_pressed(ord("0")))
	{
		var ghost_obj = instance_create_layer(m_player_object.x, m_player_object.y, "Instances", obj_ghost);
		m_player_object.cur_health = 0;
		m_player_object.outline_enable = false;
		m_player_object = ghost_obj;
	}
}
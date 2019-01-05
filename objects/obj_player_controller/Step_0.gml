var obj_x = 0, obj_y = 0;

with(m_player_object)
{
	yDir = 0;
	xDir = 0;
	
	scr_pawn_doinput();
	scr_pawn_dogamepad();
	scr_pawn_move();
	
	obj_x = x;
	obj_y = y;
}

scr_FOW_Update(obj_x, obj_y, obj_door);

//////////////////////////////////////////////////////////
// Mouse Over
var last_mouseover_object = m_mouseover_object;

if(last_mouseover_object == m_player_object)
{
	last_mouseover_object = noone;
}

m_mouseover_object = instance_position( mouse_x, mouse_y, all);

if(m_mouseover_object != noone)
{
	if(m_mouseover_object == m_player_object || object_is_ancestor(m_mouseover_object.object_index, obj_pawn) == false)
	{
		m_mouseover_object = noone;
	}
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

//////////////////////////////////////////////////////////
// Ability / Possess
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
	if(keyboard_check_pressed(vk_tab))
	{
		var ghost_obj = instance_create_layer(m_player_object.x, m_player_object.y, "Instances", obj_ghost);
		m_player_object.cur_health = 0;
		m_player_object.outline_enable = false;
		m_player_object = ghost_obj;
	}
}

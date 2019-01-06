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
var last_mouseover_object = m_InteractionObject;
m_InteractionObject = noone;

var interactionObjectList = ds_list_create();
var interactionObjectNum = collision_circle_list(obj_x, obj_y, 10, all, true, false, interactionObjectList, true);

for (var i = 0; i < interactionObjectNum; ++i;)
{
	var curObj = interactionObjectList[|i];
	
	if(curObj == m_player_object)
		continue;
	
	if(object_is_ancestor(curObj.object_index, obj_pawn) == false)
		continue;	
		
	m_InteractionObject = curObj;
}

if(last_mouseover_object != m_InteractionObject)
{
	if(last_mouseover_object != noone)
	{
		last_mouseover_object.outline_enable = false;
	}
	
	if(m_InteractionObject != noone)
	{
		m_InteractionObject.outline_enable = true;
		m_InteractionObject.outline_color = c_white;
	}
	
}

//////////////////////////////////////////////////////////
// Ability / Possess
if(m_player_object.object_index == obj_ghost)
{
	if(keyboard_check_pressed(ord("F")))
	{
		if(m_InteractionObject != noone)
		{
			with(m_player_object)
			{
				instance_destroy();
			}
			
			m_player_object = m_InteractionObject;
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

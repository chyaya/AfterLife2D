show_debug_message("Init Player Controller");

// Initialise some specific instance variables (see script for the arguments)
scr_FOW_Init_Instance(12, x, y, true);

if(instance_exists(obj_ghost) == false)
{
	show_message("no player ghost");	
}

m_player_object = instance_find(obj_ghost, 0);
m_InteractionObject = noone;
m_PlayerObjectX = m_player_object.x;
m_PlayerObjectY = m_player_object.y;

m_wall_map = layer_tilemap_get_id("Tiles");

gamepad_zoom = false;

#macro ACTION_A 0
#macro ACTION_B 1
#macro ACTION_X 2
#macro ACTION_Y 3

m_ActionNames[ACTION_A] = "";
m_ActionNames[ACTION_B] = "";
m_ActionNames[ACTION_X] = "";
m_ActionNames[ACTION_Y] = "";


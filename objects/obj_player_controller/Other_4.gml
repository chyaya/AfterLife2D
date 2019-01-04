show_debug_message("Init Player Controller");

if(instance_exists(obj_ghost) == false)
{
	show_message("no player ghost");	
}

m_player_object = instance_find(obj_ghost, 0);
m_mouseover_object = noone;

m_wall_map = layer_tilemap_get_id("Tiles");

gamepad_zoom = false;
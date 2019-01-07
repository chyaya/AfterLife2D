show_debug_message("Init Player Controller");

// Initialise some specific instance variables (see script for the arguments)
sFOW_InitInstance(12, x, y, true);

if(instance_exists(oGhost) == false)
{
	show_message("no player ghost");	
}

m_PlayerObject = instance_find(oGhost, 0);
m_InteractionObject = noone;
m_PlayerObjectX = m_PlayerObject.x;
m_PlayerObjectY = m_PlayerObject.y;

m_WallMap = layer_tilemap_get_id("Tiles");

m_GamepadZoom = false;

#macro ACTION_A 0
#macro ACTION_B 1
#macro ACTION_X 2
#macro ACTION_Y 3

m_ActionNames[ACTION_A] = "";
m_ActionNames[ACTION_B] = "";
m_ActionNames[ACTION_X] = "";
m_ActionNames[ACTION_Y] = "";


show_debug_message("Init Player Controller");

// Initialise some specific instance variables (see script for the arguments)
if(global.UseFOW)
	sFOW_InitInstance(12, x, y, true);

if(false == variable_instance_exists(id, "m_PlayerObject"))
{
	if(instance_exists(oGhost) == false)
	{
		show_message("no player ghost");	
	}

	m_PlayerObject = instance_find(oGhost, 0);
}

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

alarm[0] = room_speed;

m_MinimapGrid = ds_grid_create(global.FOW_AreaW, global.FOW_AreaH);

for (var i = 0; i < global.FOW_AreaW;  i++;)
{
	for (var j = 0; j < global.FOW_AreaH; j++;)
    {
		m_MinimapGrid[# i, j] = false;
	}
}
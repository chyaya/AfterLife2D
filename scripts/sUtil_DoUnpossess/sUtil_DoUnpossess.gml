var playerCon = argument0;

var ghost_obj = instance_create_layer(playerCon.m_PlayerObject.x, playerCon.m_PlayerObject.y, "Instances", oGhost);
playerCon.m_PlayerObject.m_CurHealth = 0;
playerCon.m_PlayerObject.m_OutlineEnable = false;
playerCon.m_PlayerObject = ghost_obj;
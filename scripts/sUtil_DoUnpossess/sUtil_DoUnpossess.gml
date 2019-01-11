var playerCon = argument0;

var ghost_obj = instance_create_layer(playerCon.m_PlayerObject.x, playerCon.m_PlayerObject.y, "Instances", oGhost);
playerCon.m_PlayerObject.m_CurHealth = 0;
playerCon.m_PlayerObject.m_OutlineEnable = false;
playerCon.m_PlayerObject.m_Rotten = true;
playerCon.m_PlayerObject = ghost_obj;

playerCon.m_CurSoulPoint = playerCon.m_CurSoulPoint - playerCon.m_UnpossessCost;
playerCon.m_CurSoulPoint = clamp(playerCon.m_CurSoulPoint, 0, playerCon.m_MaxSoulPoint);

playerCon.alarm[0] = room_speed*5;

sUtil_CreateNotify(playerCon.m_PlayerObjectX, playerCon.m_PlayerObjectY, "Soul-" + string(playerCon.m_UnpossessCost));


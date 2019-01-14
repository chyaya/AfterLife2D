var playerCon = argument0;
var possessObj = argument1;

with(playerCon.m_PlayerObject)
{
	instance_destroy();
}

playerCon.m_PlayerObject = possessObj;
playerCon.m_PlayerObject.m_CurHealth = playerCon.m_PlayerObject.m_MaxHealth;
playerCon.m_PlayerObject.m_OutlineEnable = false;
playerCon.m_PlayerObject.persistent = true;
playerCon.m_PlayerObject.alarm[1] = -1;
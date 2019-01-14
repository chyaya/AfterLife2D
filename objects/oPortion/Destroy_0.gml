/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(oPlayerController.m_PlayerObject != noone)
{
	var valueUp = 20;
	oPlayerController.m_PlayerObject.m_CurHealth += valueUp;
	oPlayerController.m_PlayerObject.m_CurHealth = min(
		oPlayerController.m_PlayerObject.m_CurHealth,
		oPlayerController.m_PlayerObject.m_MaxHealth);
	
	sUtil_CreateNotify(oPlayerController.m_PlayerObjectX, oPlayerController.m_PlayerObjectY,
		"Health+" + string(valueUp), 0, -30);
}

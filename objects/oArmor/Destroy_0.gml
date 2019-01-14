/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(oPlayerController.m_PlayerObject != noone)
{
	var valueUp = 5;
	oPlayerController.m_PlayerObject.m_MaxHealth += valueUp;
	sUtil_CreateNotify(oPlayerController.m_PlayerObjectX, oPlayerController.m_PlayerObjectY,
		"Max Health+" + string(valueUp), 0, -30);
}

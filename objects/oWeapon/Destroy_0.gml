// Inherit the parent event
event_inherited();

if(oPlayerController.m_PlayerObject != noone)
{
	var valueUp = 1;
	oPlayerController.m_PlayerObject.m_Damage += valueUp;
	sUtil_CreateNotify(oPlayerController.m_PlayerObjectX, oPlayerController.m_PlayerObjectY,
		"Damage+" + string(valueUp), 0, -30);
}

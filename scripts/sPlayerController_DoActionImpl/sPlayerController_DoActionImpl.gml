var btnPressed = argument0;

if(false == btnPressed)
	return;
	
var actionName = argument1;

switch(actionName)
{
case "Possess":
	with(m_PlayerObject)
	{
		instance_destroy();
	}
	m_PlayerObject = m_InteractionObject;
	m_PlayerObject.m_CurHealth = m_PlayerObject.m_MaxHealth;
	m_PlayerObject.m_OutlineEnable = false;
	m_PlayerObject.persistent = true;
	break;
case "Unpossess":
	if(m_CurSoulPoint > m_UnpossessCost)
	{
		sUtil_DoUnpossess(self);
	}
	else
	{
		sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul is too low");
	}
	break;
case "Collect":
	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul+10");
	m_CurSoulPoint += 10;
	if(m_CurSoulPoint >= m_MaxSoulPoint)
		m_CurSoulPoint = m_MaxSoulPoint;
	break;
case "Open":
	if(m_InteractionObject.m_ActionSound != noone)
		audio_play_sound(m_InteractionObject.m_ActionSound, 1, false);
	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	FOW_Dirty = true;
	break;
case "Attack":
	sUtil_DoAttack(m_PlayerObject, room_speed*0.2);
	break;
case "Down":
	room_goto_next();
	break;
}
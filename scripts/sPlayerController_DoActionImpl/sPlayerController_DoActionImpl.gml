var btnPressed = argument0;

if(false == btnPressed)
	return;
	
var actionName = argument1;

switch(actionName)
{
case "Possess":
	if(m_InteractionObject.object_index == oPileOfCorpses)
	{
		var obj = sUtil_CreateCorpse(m_PlayerObjectX, m_PlayerObjectY, 0);
		sUtil_DoPossess(self, obj);
	}
	else
	{
		sUtil_DoPossess(self, m_InteractionObject);
	}
	sPlayerController_ClearInteractObject();
	break;
case "Unpossess":
	if(room == room_Boss)
	{
		sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Can't do that", 0, -30);
	}
	else if(m_CurSoulPoint > m_UnpossessCost)
	{
		sUtil_DoUnpossess(self);
	}
	else
	{
		sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul is too low", 0, -30);
	}
	break;
case "Collect":
	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	sUtil_CreateNotify(m_PlayerObjectX, m_PlayerObjectY, "Soul+10", 0, -30);
	m_CurSoulPoint += 10;
	if(m_CurSoulPoint >= m_MaxSoulPoint)
		m_CurSoulPoint = m_MaxSoulPoint;
	break;
case "Open":
case "Equip":
case "Use":
	if(m_InteractionObject.m_ActionSound != noone)
		audio_play_sound(m_InteractionObject.m_ActionSound, 1, false);
	if(m_InteractionObject.m_BlockMove == true)
		FOW_Dirty = true;
	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	break;
case "Attack":
	sUtil_DoAttack(m_PlayerObject, room_speed*0.2);
	break;
case "Down":
	room_goto_next();
	break;
case "PickUp":

	with(m_PlayerObject)
	{
		sPawn_Inven_AddItem(other.m_InteractionObject.m_ItemId, 1);
	}

	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	break;
}
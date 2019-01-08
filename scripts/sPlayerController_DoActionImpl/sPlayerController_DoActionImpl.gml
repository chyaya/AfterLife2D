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
	break;
case "Unpossess":
	var ghost_obj = instance_create_layer(m_PlayerObject.x, m_PlayerObject.y, "Instances", oGhost);
	m_PlayerObject.m_CurHealth = 0;
	m_PlayerObject.m_OutlineEnable = false;
	m_PlayerObject = ghost_obj;
	break;
case "Open":
	instance_destroy(m_InteractionObject);
	m_InteractionObject = noone;
	FOW_Dirty = true;
	break;
case "Attack":
	with (instance_create_layer(m_PlayerObject.x, m_PlayerObject.y, "Instances", oBlank))
	{
		m_OwnerObj = other.m_PlayerObject.id;
		
		instance_change(oMelee, true);
	}
	break;
}
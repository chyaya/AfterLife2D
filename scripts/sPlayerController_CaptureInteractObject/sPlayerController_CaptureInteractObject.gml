var lastMouseOverObject = m_InteractionObject;
m_InteractionObject = noone;

var interactionObjectList = ds_list_create();
var interactionObjectNum = collision_circle_list(
	m_PlayerObjectX, m_PlayerObjectY, 10, all, true, false, interactionObjectList, true);

for (var i = 0; i < interactionObjectNum; ++i;)
{
	var curObj = interactionObjectList[|i];
	
	if(curObj == m_PlayerObject)
		continue;
	
	if(object_is_ancestor(curObj.object_index, oBase) == false)
		continue;	
		
	if(object_is_ancestor(curObj.object_index, oPawn))
	{
		if(curObj.m_CurHealth == 0 && curObj.m_Rotten)
			continue;
	}
		
	m_InteractionObject = curObj;
}

if(lastMouseOverObject != m_InteractionObject)
{
	if(lastMouseOverObject != noone)
	{
		lastMouseOverObject.m_OutlineEnable = false;
	}
	
	if(m_InteractionObject != noone)
	{
		m_InteractionObject.m_OutlineEnable = true;
		m_InteractionObject.m_OutlineColor = c_white;
	}
	
}

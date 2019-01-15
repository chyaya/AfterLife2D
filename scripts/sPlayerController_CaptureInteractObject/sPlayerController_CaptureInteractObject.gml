var newMouseOverObject = noone;

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
		
		/*
	if(object_is_ancestor(curObj.object_index, oPawn))
	{
		if(curObj.m_CurHealth == 0 && curObj.m_Rotten)
			continue;
	}
	*/
		
	newMouseOverObject = curObj;
}

if(newMouseOverObject != m_InteractionObject)
{
	sPlayerController_ClearInteractObject();
	
	if(newMouseOverObject != noone)
	{
		newMouseOverObject.m_OutlineEnable = true;
		newMouseOverObject.m_OutlineColor = c_white;
		m_InteractionObject = newMouseOverObject;
	}
	
}

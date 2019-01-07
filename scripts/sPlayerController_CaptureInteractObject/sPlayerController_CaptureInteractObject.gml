var lastMouseOverObject = m_InteractionObject;
m_InteractionObject = noone;

var interactionObjectList = ds_list_create();
var interactionObjectNum = collision_circle_list(
	m_PlayerObjectX, m_PlayerObjectY, 10, all, true, false, interactionObjectList, true);

for (var i = 0; i < interactionObjectNum; ++i;)
{
	var curObj = interactionObjectList[|i];
	
	if(curObj == m_player_object)
		continue;
	
	if(object_is_ancestor(curObj.object_index, oBase) == false)
		continue;	
		
	m_InteractionObject = curObj;
}

if(lastMouseOverObject != m_InteractionObject)
{
	if(lastMouseOverObject != noone)
	{
		lastMouseOverObject.outline_enable = false;
	}
	
	if(m_InteractionObject != noone)
	{
		m_InteractionObject.outline_enable = true;
		m_InteractionObject.outline_color = c_white;
	}
	
}

var objList = ds_list_create();
var objListCount = collision_circle_list(x, y, m_AI_SearchRange, oPawn, true, true, objList, false);
	
var targetObj = noone;
for(var i = 0; i < objListCount; ++i)
{
	var obj = objList[|i];
	if(obj.object_index != oGhost
		&& obj == oPlayerController.m_PlayerObject)
	{
		m_AI_TargetObject = obj;
		break;
	}
}
	
ds_list_destroy(objList);
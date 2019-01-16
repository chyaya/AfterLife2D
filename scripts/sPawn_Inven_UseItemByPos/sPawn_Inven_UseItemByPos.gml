var itemPos = argument0;

if(itemPos == 0)
	return;

var itemId = inv[itemPos];
if(itemId == 0)
	return;

if(sPawn_Inven_RemoveItemByPos(itemPos) == 0)
{
	if(global.Item_OnUse[itemId] != noone)
		script_execute(global.Item_OnUse[itemId], self);
}
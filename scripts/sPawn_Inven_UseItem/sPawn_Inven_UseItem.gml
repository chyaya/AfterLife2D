var itemId = argument0;

if(sPawn_Inven_RemoveItem(itemId, 1) == 0)
{
	if(global.Item_OnUse[itemId] != noone)
		script_execute(global.Item_OnUse[itemId], self);
}
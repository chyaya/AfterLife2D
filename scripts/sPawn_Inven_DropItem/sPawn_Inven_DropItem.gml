var itemId = argument0;
var _x = argument1;
var _y = argument2;

if(itemId == 0)
	return;

if(sPawn_Inven_RemoveItem(itemId, 1) != 0)
	return;

with(instance_create_layer(_x, _y, "Props", oBlank))
{
	m_ItemId = argument0;

	instance_change(oItem, true);
}
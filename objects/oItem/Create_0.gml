// Inherit the parent event
event_inherited();

if(false == variable_instance_exists(id, "m_ItemId"))
{
	m_ItemId = irandom(array_length_1d(global.Item_Text) - 2) + 1;
}

sprite_index = global.Item_Sprite[m_ItemId];
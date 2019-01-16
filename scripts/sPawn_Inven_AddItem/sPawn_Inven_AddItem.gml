/// @description inv_add_item(itemid,number of items)
/// @param itemid
/// @param number of items

//Adds items to your inventory.

var ii = 1
var items = argument1
while (ii <= total_slots) and items > 0 {
    if inv[ii]=0
	{
		inv[ii]=argument0
		
		if(global.Item_OnAddOrRemove[inv[ii]] != noone)
			script_execute(global.Item_OnAddOrRemove[inv[ii]], self, 1);
			
		items-=1
	}
    ii++
}

return items;

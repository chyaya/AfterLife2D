var itemId = argument0;
var items = argument1;

if(itemId == 0)
	return items;

var ii = 1
while (ii <= total_slots) and items > 0
{
    if inv[ii] == itemId
	{
		if(global.Item_OnRemove[inv[ii]] != noone)
			script_execute(global.Item_OnRemove[inv[ii]], self);
			
		inv[ii] = 0;
		--items;
	}
    ii++
}

return items;
var itemPos = argument0;

if(itemPos == 0)
	return 1;

var itemId = inv[itemPos];

if(itemId == 0)
	return 1;
	
inv[itemPos] = 0;

if(global.Item_OnAddOrRemove[itemId] != noone)
	script_execute(global.Item_OnAddOrRemove[itemId], self, -1);
			
return 0;
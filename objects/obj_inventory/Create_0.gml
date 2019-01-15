//Edit these variables to customize the look of your inventory.

EDIT_ME()

row = 0
column = 0
selected = 0 
slots_in_row -= 1

hold = 0 //Used for inventory. The item id of what you are holding on your mouse
select1 = 0 //The first slot you select
select2 = 0 //The second slot you select
selectid1 = 0 //The item id in the first slot
selectid2 = 0 //The item id in the second slot
mousedover = 0 //The item id of the sprite drawn on your mouse


//Create Inventory Slots

p = 1
while p < total_slots {
    inv[p]=0;
    p++;
}
inv[p++]=0



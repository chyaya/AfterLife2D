//Edit these variables to customize the look of your inventory.
total_slots     =   6                  //The total number of invetory slots
slots_in_row    =   6                   //The number of slots per row
slot_sprite     =   spr_slot            //The sprite of your slot.
slot_selected   =   spr_selected_slot   //The sprite of the slot when it's selected

row = 0
column = 0
selected = 1
slots_in_row -= 1

hold = 0 //Used for inventory. The item id of what you are holding on your mouse
select1 = 0 //The first slot you select
select2 = 0 //The second slot you select
selectid1 = 0 //The item id in the first slot
selectid2 = 0 //The item id in the second slot
mousedover = 0 //The item id of the sprite drawn on your mouse

//Create Inventory Slots
var p = 1
while p < total_slots {
    inv[p]=0;
    p++;
}
inv[p++]=0

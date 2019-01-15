/// @description inv_get_first_slot_of(item id)
/// @param item id

//Returns the first slot id that holds a specific item id.

var ii = 1
while (ii <= total_slots) {
   if inv[ii]=argument0 {return ii}
   ii++
}
return 0

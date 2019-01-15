//This is how items are added to your inventory.
//You can change is event to however you want items to be picked up.

var ss = 1
var claimed = false
while ss <= obj_inventory.total_slots and claimed = false {
    if obj_inventory.inv[ss]=0 {obj_inventory.inv[ss]=itemid instance_destroy() claimed = true}
    ss++;
}


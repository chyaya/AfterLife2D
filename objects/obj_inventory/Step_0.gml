/*
if show_inventory = true {
    x_mouse = device_mouse_x_to_gui(0); //Determine where the mouse is on the view.
    y_mouse = device_mouse_y_to_gui(0);
    
    if (y_mouse > inventory_y and y_mouse < inventory_y+ceil(total_slots/slots_in_row)*slot_size) and //Are you mousing in the inventory?
        (x_mouse > inventory_x and x_mouse < inventory_x+(slots_in_row+1)*slot_size) {
        row = ceil((y_mouse-inventory_y)/slot_size)
        column = ceil((x_mouse-inventory_x)/slot_size)
        hover = true
    }
    else {
        hover = false
    }
    
    if hover = true { //Which slot are you selecting?
        selected = column+((row-1)*(slots_in_row+1))
        if selected > total_slots selected = 0
    }
    else {
        selected = 0
    }
    
    if selected != 0 { //Are you mousing over the inventory? 
        if mouse_check_button_pressed(mb_left) { //Select the first item.
            select1 = selected 
            selectid1 = inv[select1]
            }
            
        if mouse_check_button_released(mb_left) { //Select the second item.
            select2 = selected
            selectid2 = inv[select2]
            if select1 != select2 && select1 != 0 { //Are the items switching slots?
                hold = selectid1
                selectid1 = selectid2
                selectid2 = hold
                inv[select1] = selectid1 //Switch them.
                inv[select2] = selectid2
                select1 = 0
                select2 = 0
                selectid1 = 0
                selectid2 = 0
                hold = 0
            }
            else {
                item = inv[selected]
                inv_item_action_left() //Do the left click action.
                select1 = 0
                select2 = 0
                selectid1 = 0
                selectid2 = 0
                hold = 0
            }
        }
        if mouse_check_button_released(mb_right) { //Do the right click action.
            item = inv[selected]
            inv_item_action_right()
            select1 = 0
            select2 = 0
            selectid1 = 0
            selectid2 = 0
            hold = 0
            }     
    }
    else {
        if mouse_check_button_released(mb_left) { //Drop the item.
            inv_drop_item(inv[select1])
            inv[select1] = 0
            select1 = 0
            select2 = 0
            selectid1 = 0
            selectid2 = 0
        }
    }
}
*/
if(m_PlayerObject == noone)
	return;
	
if(m_PlayerObject.object_index == oGhost)
	return;

with(m_PlayerObject)
{
	if show_inventory = true {
	    ss = 1
	    xx = 0
	    yy = 0
	    while (ss <= total_slots) { //Draw the background slots.
	        if (xx <= slots_in_row) {
	            if selected = ss {
	                draw_sprite_stretched(
						slot_selected,0,xx*slot_size+inventory_x,yy*slot_size+inventory_y,
						slot_size, slot_size);
	                }
	            else {
	                draw_sprite_stretched(
						slot_sprite,0,xx*slot_size+inventory_x,yy*slot_size+inventory_y,
						slot_size, slot_size);
	                }
	            xx+=1;
	            ss+=1;
	        }
	        else {
	            yy+=1;
	            xx=0;
	        }
	    } 
    
	    ss = 1
	    xx = 0
	    yy = 0
	    while (ss <= total_slots) { //Draw the item icons.
	        if (xx <= slots_in_row) {
	            if select1 != ss {
	                draw_sprite_stretched(
						global.Item_Sprite[inv[ss]],0,xx*slot_size+inventory_x,yy*slot_size+inventory_y,
						slot_size, slot_size);
	            }
	            xx+=1;
	            ss+=1;
	        }
	        else {
	            yy+=1;
	            xx=0;
	        }
	    } 
    
	    ss = 1
	    xx = 0
	    yy = 0
	    while (ss <= total_slots) { //Draw the item on your mouse.
	        if (xx <= slots_in_row) {
	            if select1 = ss {
	                draw_sprite_stretched(
						global.Item_Sprite[inv[ss]], 0,
						mouse_x-slot_size/2 - __view_get( e__VW.XView, 0 ),
						mouse_y-slot_size/2 - __view_get( e__VW.YView, 0 ),
						slot_size, slot_size);
	            }
	            xx+=1;
	            ss+=1;
	        }
	        else {
	            yy+=1;
	            xx=0;
	        }
	    } 
	}
}
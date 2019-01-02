with(player_object_inst_id)
{
	var seconds_passed = delta_time/1000000;
	var move_speed_this_frame = move_speed*seconds_passed;

	//////////////////////////////////////////////////////////
	// Move Input
	var last_x = x, last_y = y;

	if(keyboard_check(ord("W")))
	{
		y -= move_speed_this_frame;
	}

	if(keyboard_check(ord("S")))
	{
		y += move_speed_this_frame;
	}

	if(keyboard_check(ord("A")))
	{
		x -= move_speed_this_frame;
	}

	if(keyboard_check(ord("D")))
	{
		x += move_speed_this_frame;
	}

	xDir = x - last_x;
	yDir = y - last_y;

	//////////////////////////////////////////////////////////
	// Ability Input
	
	if(object_index != obj_ghost)
	{
		if(mouse_check_button_pressed(mb_left))
		{
			if(ability1 != noone)
				script_execute(ability1);
		}
	}
}

if(player_object_inst_id.object_index == obj_ghost)
{
	if(mouse_check_button_pressed(mb_left))
	{
		var clicked_obj = instance_position( mouse_x, mouse_y, all );
	        
		if(clicked_obj != noone)
		{
			with(player_object_inst_id)
			{
				instance_destroy();
			}
			
			player_object_inst_id = clicked_obj;
			player_object_inst_id.cur_health = player_object_inst_id.max_health;
		}
	}
}
else
{
	if(keyboard_check_pressed(ord("0")))
	{
		
		
		var ghost_obj = instance_create_layer(player_object_inst_id.x, player_object_inst_id.y, "Instances", obj_ghost);
		player_object_inst_id.cur_health = 0;
		
		player_object_inst_id = ghost_obj;
		
	}
}
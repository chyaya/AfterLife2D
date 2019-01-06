if(m_ShowDebugMap)
{
	scr_BSP_Draw_Debug(bsp_grid, cell_size);
	
	if(obj_player_controller.m_player_object != noone)
	{
		var player_x = obj_player_controller.m_player_object.x;
		var player_y = obj_player_controller.m_player_object.y;
		
		draw_circle_color(player_x, player_y, cell_size/2, c_red, c_red, true);
	}
}
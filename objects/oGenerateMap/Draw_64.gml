if(m_ShowDebugMap)
{
	scr_BSP_Draw_Debug(bsp_grid, cell_size);
	
	if(oPlayerController.m_player_object != noone)
	{
		var player_x = oPlayerController.m_player_object.x;
		var player_y = oPlayerController.m_player_object.y;
		
		draw_circle_color(player_x, player_y, cell_size/2, c_red, c_red, true);
	}
}
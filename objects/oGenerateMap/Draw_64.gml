if(m_ShowDebugMap)
{
	sBSP_DrawDebug(bsp_grid, cell_size);
	
	if(oPlayerController.m_PlayerObject != noone)
	{
		var player_x = oPlayerController.m_PlayerObject.x;
		var player_y = oPlayerController.m_PlayerObject.y;
		
		draw_circle_color(player_x, player_y, cell_size/2, c_red, c_red, true);
	}
}
if(m_AI_Control)
{
	m_AI_PlayerVisible = sPawn_PlayerVisible();
	
	if(m_AI_PlayerVisible)
	{
		if(m_AI_TargetObject == noone)
		{
			sPawn_AI_UpdateTarget();
		}
	}
	
	if(m_AI_TargetObject)
	{
		if(m_AI_TargetObject.m_CurHealth == 0)
		{
			sPawn_AI_ClearTarget();
			exit;
		}
		
		var distance = point_distance(x, y, m_AI_TargetObject.x, m_AI_TargetObject.y);
		
		
		if(distance <= 15)
	    {
	        sPawn_EndPath();
			
			m_DirX = 0;
			m_DirY = 0;
			
			if(m_Attacking == false)
				sUtil_DoAttack(self, room_speed*0.5);
	    }
		else if(distance > 150)
		{
			sPawn_AI_ClearTarget();
		}
		else
		{
			var pathTargetX = aStar_get_cell_coordinate(m_AI_TargetObject.x);
			var pathTargetY = aStar_get_cell_coordinate(m_AI_TargetObject.y);
		
			if(position_get_x(m_PathEndPos) != pathTargetX
				|| position_get_y(m_PathEndPos) != pathTargetY)
			{
				//show_debug_message(string(current_time) + " path finding");
			
				var cellSize = aStar_get_cell_size();
				var halfCellSize = cellSize div 2;
				var pathMyX = aStar_get_cell_coordinate(x);
				var pathMyY = aStar_get_cell_coordinate(y);
		
				sPawn_EndPath();
		
				m_Path = aStar_find_path(pathMyX, pathMyY, pathTargetX, pathTargetY);
		
				if(m_Path != undefined)
				{
					path_delete_point(m_Path, 0);
					path_insert_point(m_Path, 0, x, y, 100);
					
					funcPathOptimized(m_Path, aStar_get_cell_size());
				
					path_start(m_Path, m_MoveSpeed/room_speed*m_AI_MoveSpeedRate, path_action_reverse, true);
				
					m_PathEndPos = position_create(pathTargetX, pathTargetY);
				}
			}
			
			m_DirX = sUtil_AngleToDirX(direction);
			m_DirY = sUtil_AngleToDirY(direction);
		}
	}
	
}
else
{
	m_AI_PlayerVisible = false;
}
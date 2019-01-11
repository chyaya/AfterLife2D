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
			m_AI_TargetObject = noone;
			m_DirX = 0;
			m_DirY = 0;
			
			if(m_Path != undefined)
			{
				m_Path = undefined;
				path_end();
			}
			
			exit;
		}
		
		
		if(point_distance(x, y, m_AI_TargetObject.x, m_AI_TargetObject.y) <= 15)
	    {
	        sPawn_EndPath();
			
			m_DirX = 0;
			m_DirY = 0;
			
			if(m_Attacking == false)
				sUtil_DoAttack(self, room_speed*0.5);
	    }
		else
		{
			var pathTargetX = aStar_get_cell_coordinate(m_AI_TargetObject.x);
			var pathTargetY = aStar_get_cell_coordinate(m_AI_TargetObject.y);
		
			if(position_get_x(m_PathEndPos) != pathTargetX
				|| position_get_y(m_PathEndPos) != pathTargetY)
			{
				show_debug_message(string(current_time) + " path finding");
			
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
				
					path_start(m_Path, m_MoveSpeed/room_speed*m_AI_MoveSpeedRate, path_action_reverse, true);
				
					m_PathEndPos = position_create(pathTargetX, pathTargetY);
				}
			}
			
			m_DirX = sUtil_AngleToDirX(direction);
			m_DirY = sUtil_AngleToDirY(direction);
		}
	
		
		/*
		var seconds_passed = delta_time/1000000;
		var move_speed_this_frame = m_MoveSpeed*seconds_passed*m_AI_MoveSpeedRate;
		var targetVectorX = m_AI_TargetObject.x - x;
		var targetVectorY = m_AI_TargetObject.y - y;
		var targetVectorLength = sqrt(targetVectorX*targetVectorX + targetVectorY*targetVectorY);
		
		if(abs(targetVectorX) < 0.5)
			targetVectorX = 0;
			
		if(abs(targetVectorY) < 0.5)
			targetVectorY = 0;
		
		if(targetVectorLength > 15)
		{
			m_DirX = sign(targetVectorX);
			m_DirY = sign(targetVectorY);
			
			sPawn_Move(m_AI_MoveSpeedRate);
		}
		else
		{
			m_DirX = 0;
			m_DirY = 0;
			
			if(m_Attacking == false)
				sUtil_DoAttack(self, room_speed*0.5);
		}
		*/
	}
	
}
else
{
	m_AI_PlayerVisible = false;
}
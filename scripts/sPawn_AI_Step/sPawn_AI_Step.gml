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
			exit;
		}
		
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
			
			if(targetVectorX != 0)
				x += m_DirX*move_speed_this_frame;
		
			if(targetVectorY != 0)
				y += m_DirY*move_speed_this_frame;
		}
		else
		{
			m_DirX = 0;
			m_DirY = 0;
			
			if(m_Attacking == false)
				sUtil_DoAttack(self, room_speed*1);
		}
	}
	
}
else
{
	m_AI_PlayerVisible = false;
}
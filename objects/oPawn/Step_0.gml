sPawn_AI_Step();
sPawn_Appearance(self, m_DirX, m_DirY);

if(m_CurHealth == 0 && m_LastHealth > 0 && object_index != oGhost)
{
	event_user(0);
}

m_LastHealth = m_CurHealth;

if(m_DirX != 0 || m_DirY != 0)
{
	direction = sUtil_DirToAngle(m_DirX, m_DirY);
}


if(m_PlayFootStepSound
	&& (m_DirX != 0 || m_DirY != 0)
	&& m_LastImageIndex > 1 && image_index <= 1)
{
	var snd = 0;
	switch(irandom(3))
	{
	case 0: snd = sndFootstep1; break;
	case 1: snd = sndFootstep2; break;
	case 2: snd = sndFootstep3; break;
	case 3: snd = sndFootstep4; break;
	}
	
	//audio_play_sound_at(snd, x, y, 0, 0, 1, 1, false, 1);
	//if(false == audio_is_playing(sndFootstep1))
	audio_play_sound(snd, 1, false);
}

m_LastImageIndex  = image_index;


var rottenAlarmTime = alarm_get(1);
if(rottenAlarmTime > 0)
{
	var leftSec = rottenAlarmTime div room_speed + 1;
	
	if(leftSec != m_RottenNotifySec)
	{
		sUtil_CreateNotify(x, y, string(leftSec), 0, 0);
		
		m_RottenNotifySec = leftSec;
	}
}
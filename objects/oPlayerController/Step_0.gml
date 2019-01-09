if(m_CurSoulPoint <= 0)
	m_GameOver = true;

m_Input_AxisL_Up = false;
m_Input_AxisL_Down = false;
m_Input_AxisL_Left = false;
m_Input_AxisL_Right = false;
m_Input_Btn_A = false;
m_Input_Btn_B = false;
m_Input_Btn_X = false;
m_Input_Btn_Y = false;
m_Input_Btn_Select = false;
m_Input_Btn_Start = false;

sPlayerController_CaptureKeyboard();
sPlayerController_CaptureGamepad();

if(m_PlayerObject != noone)
{
	with(m_PlayerObject)
	{
		m_DirY = 0;
		m_DirX = 0;
	
		if(other.m_Input_AxisL_Up)
		{
			m_DirY -= 1;
		}
		else if(other.m_Input_AxisL_Down)
		{
			m_DirY += 1;
		}
	
		if(other.m_Input_AxisL_Left)
		{
			m_DirX -= 1;
		}
		else if(other.m_Input_AxisL_Right)
		{
			m_DirX += 1;
		}
	
		sPawn_Move(1.0);
	}
	
	m_PlayerObjectX = m_PlayerObject.x;
	m_PlayerObjectY = m_PlayerObject.y;	
}

sPlayerController_CaptureInteractObject();

if(global.UseFOW)
	sFOW_Update(m_PlayerObjectX, m_PlayerObjectY, oDoor);


if(other.m_Input_Btn_Start)
{
	game_restart();
}
		
if(other.m_Input_Btn_Select)
{
	m_GamepadZoom = !m_GamepadZoom;
		
	if(other.m_GamepadZoom)
	{
		oCamera.zoom = 1.0;
	}
	else
	{
		oCamera.zoom = 4.0;
	}
}
	

//////////////////////////////////////////////////////////
// Ability / Possess

m_ActionNames[ACTION_A] = "";
m_ActionNames[ACTION_B] = "";
m_ActionNames[ACTION_X] = "";
m_ActionNames[ACTION_Y] = "";

sPlayerController_SelectAction();
sPlayerController_DoAction();
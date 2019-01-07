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

if(m_player_object != noone)
{
	with(m_player_object)
	{
		yDir = 0;
		xDir = 0;
	
		if(other.m_Input_AxisL_Up)
		{
			yDir -= 1;
		}
		else if(other.m_Input_AxisL_Down)
		{
			yDir += 1;
		}
	
		if(other.m_Input_AxisL_Left)
		{
			xDir -= 1;
		}
		else if(other.m_Input_AxisL_Right)
		{
			xDir += 1;
		}
	
		scr_pawn_move();
	}
	
	m_PlayerObjectX = m_player_object.x;
	m_PlayerObjectY = m_player_object.y;	
}

sPlayerController_CaptureInteractObject();

scr_FOW_Update(m_PlayerObjectX, m_PlayerObjectY, oDoor);


if(other.m_Input_Btn_Start)
{
	game_restart();
}
		
if(other.m_Input_Btn_Select)
{
	gamepad_zoom = !gamepad_zoom;
		
	if(other.gamepad_zoom)
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
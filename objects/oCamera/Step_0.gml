x += (m_TargetX - x)/25;
y += (m_TargetY - y)/25;

m_Follow = oPlayerController.m_PlayerObject;

if(m_Follow != noone)
{
	m_TargetX = m_Follow.x;
	m_TargetY = m_Follow.y;
}

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
camera_set_view_mat(m_Camera, vm);

if(mouse_wheel_down())
{
	m_Zoom /= m_ZoomSpeed;
}

if(mouse_wheel_up())
{
	m_Zoom *= m_ZoomSpeed;
}

	
if(m_LastZoom != m_Zoom)
{
	var pm = matrix_build_projection_ortho(view_wport[0]/m_Zoom, view_hport[0]/m_Zoom, 1, 10000);
	camera_set_proj_mat(m_Camera, pm);
}

m_LastZoom = m_Zoom;
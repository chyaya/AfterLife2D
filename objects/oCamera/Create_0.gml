show_debug_message("Init Camera");

m_Camera = camera_create();

m_Zoom = 4.0;
m_LastZoom = m_Zoom;
m_ZoomSpeed = 1.1;

var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var viewW = view_wport[0]/m_Zoom;
var viewH = view_hport[0]/m_Zoom;
var pm = matrix_build_projection_ortho(viewW, viewH, 1, 10000);

camera_set_view_mat(m_Camera, vm);
camera_set_proj_mat(m_Camera, pm);
camera_set_view_size(m_Camera, viewW, viewH);

view_camera[0] = m_Camera;

m_TargetX = x;
m_TargetY = y;

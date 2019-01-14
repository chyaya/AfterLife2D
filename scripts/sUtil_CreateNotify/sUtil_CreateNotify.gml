var _x = argument0;
var _y = argument1;
var _text = argument2;
var _vx = argument3;
var _vy = argument4;

with(instance_create_layer(_x, _y, "Effects", oNotify))
{
	m_Text = _text;
	m_VX = _vx;
	m_VY = _vy;
}

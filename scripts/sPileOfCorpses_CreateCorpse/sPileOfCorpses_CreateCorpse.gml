#macro TILE_SIZE	16
#macro OFFSET_SIZE	(TILE_SIZE div 2)

var _x = x + OFFSET_SIZE;
var _y = y + OFFSET_SIZE;
var _deploy_x = _x;
var _deploy_y = _y;

switch(irandom(3))
{
case 0:
	_deploy_x -= TILE_SIZE;
	break;
case 1:
	_deploy_x += TILE_SIZE;
	break;
case 2:
	_deploy_y -= TILE_SIZE;
	break;
case 3:
	_deploy_y += TILE_SIZE;
	break;
}

if(place_meeting(_x, _y, oMan))
	return;

with(instance_create_layer(_deploy_x, _deploy_y, "Instances", oBlank))
{
	m_Level = 0;
	
	instance_change(irandom(1) ? oMan : oWoman, true);

	m_CurHealth = 0;
}
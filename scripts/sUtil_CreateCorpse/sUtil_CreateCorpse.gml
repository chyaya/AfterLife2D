var _x = argument0;
var _y = argument1;
var _lvl = argument2;

#macro TILE_SIZE	16

var _deploy_x = _x;
var _deploy_y = _y;

//switch(irandom(3))
//{
//case 0:
//	_deploy_x -= TILE_SIZE;
//	break;
//case 1:
//	_deploy_x += TILE_SIZE;
//	break;
//case 2:
//	_deploy_y -= TILE_SIZE;
//	break;
//case 3:
//	_deploy_y += TILE_SIZE;
//	break;
//}
	
var obj = noone;

with(instance_create_layer(_deploy_x, _deploy_y, "Instances", oBlank))
{
	m_Level = _lvl;
	m_CurHealth = 0;
	
	instance_change(irandom(1) == 0 ? oMan : oWoman, true);
	obj = self;
}

return obj;
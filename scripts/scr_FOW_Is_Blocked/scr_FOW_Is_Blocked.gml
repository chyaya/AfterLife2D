var _x = argument0;
var _y = argument1;
var _ts = argument2;
var _obj = argument3;

var tile = tilemap_get(obj_player_controller.m_wall_map, floor(_x/_ts),floor(_y/_ts) )& tile_index_mask;

if(scr_Is_Block_Tile_Index(tile))
	return true;

var inst = instance_position(_x, _y, _obj);

if(inst)
	return true;	
	
return false;
var _x = argument0;
var _y = argument1;
var _ts = argument2;
var _viewOnly = argument3;

var tile = tilemap_get(oPlayerController.m_wall_map, floor(_x/_ts),floor(_y/_ts) )& tile_index_mask;

if(sIsBlockTileIndex(tile))
	return true;
	
// 귀신인 경우에는 오브젝트를 통과할 수 있다.
if(!_viewOnly && oPlayerController.m_player_object.object_index == oGhost)
	return false;

var _list = ds_list_create();
var _listCount = instance_position_list(_x, _y, all, _list, false);
var result = false;

for(var i = 0; i < _listCount; ++i)
{
	var o = _list[|i];
	if(false == object_is_ancestor(o.object_index, oBase))
		continue;
		
	if(o.m_BlockMove)
	{
		result = true;
		break;
	}
}
	
ds_list_destroy(_list);
return result;
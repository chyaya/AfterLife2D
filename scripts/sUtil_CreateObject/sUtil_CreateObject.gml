var _x = argument0;
var _y = argument1;
var _lay = argument2;
var _obj = argument3;

if(place_meeting(_x, _y, _obj))
	return false;

instance_create_layer(_x, _y, _lay, _obj);

return true;
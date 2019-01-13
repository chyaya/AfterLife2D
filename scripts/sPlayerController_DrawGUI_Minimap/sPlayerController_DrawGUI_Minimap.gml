var cellSize = 16;
var rectSize =	5;
var wallColor = c_gray;
var offsetSize = 150;
var startX = offsetSize;
var startY = view_hport[0] - offsetSize - room_height/cellSize*rectSize;

for (var i = 0; i < global.FOW_AreaW;  i++;)
{
	for (var j = 0; j < global.FOW_AreaH; j++;)
    {
		var x1 = startX + i*rectSize;
		var y1 = startY + j*rectSize;
		var x2 = x1 + rectSize - 1;
		var y2 = y1 + rectSize - 1;
		
		if(m_MinimapGrid[# i, j] && aStar_get_blocked(i, j))
		{
			draw_rectangle_color(x1, y1, x2, y2,
				wallColor, wallColor, wallColor, wallColor, false);
		}
	}
}

// Door
for (i = 0; i < instance_number(all); i += 1)
{
	var obj = instance_find(all, i);
	
	if(false == object_is_ancestor(obj.object_index, oBase))
		continue;
		
	if(false == obj.m_MinimapVisible)
		continue;
	
	var cellX = obj.x div cellSize;
	var cellY = obj.y div cellSize;
	
	if(m_MinimapGrid[# cellX, cellY])
	{
		var x1 = startX + cellX*rectSize;
		var y1 = startY + cellY*rectSize;
		var x2 = x1 + rectSize - 1;
		var y2 = y1 + rectSize - 1;
	
		draw_rectangle_color(x1, y1, x2, y2,
			obj.m_MinimapColor, obj.m_MinimapColor, obj.m_MinimapColor, obj.m_MinimapColor, false);
	}
}
	
// Player
var playerColor = c_aqua;
var x1 = startX + (m_PlayerObjectX div cellSize)*rectSize;
var y1 = startY + (m_PlayerObjectY div cellSize)*rectSize;
var x2 = x1 + rectSize - 1;
var y2 = y1 + rectSize - 1;

draw_rectangle_color(x1, y1, x2, y2,
	playerColor, playerColor, playerColor, playerColor, false);
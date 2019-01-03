#macro TILE_SIZE	16
#macro TILE_SHIFT   4		// 1<<4 = 16
#macro TILE_OFFSET	8

#macro OBJ_HALF_W	5
#macro OBJ_HALF_H	5

var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed;
	
x += xDir*move_speed_this_frame;

if( xDir != 0 )
{
	var tx	= (x + xDir*OBJ_HALF_W - TILE_OFFSET)>>TILE_SHIFT;		// check right edge
	var ty1 = ((y + OBJ_HALF_H - TILE_OFFSET - 1)>>TILE_SHIFT);
	var ty2 = ((y - OBJ_HALF_H - TILE_OFFSET)>>TILE_SHIFT);
		
	var tile1 = tilemap_get(other.m_wall_map, tx,ty1 )& tile_index_mask;
	var tile2 = tilemap_get(other.m_wall_map, tx,ty2 )& tile_index_mask;
		
	//show_debug_message("(collision X) tile1:" + string(tile1) + ", tile2: " + string(tile2));
		
	if(( tile1!=0 ) || (tile2!=0))
	{
		if(xDir > 0)
		{
			x = (tx<<TILE_SHIFT) - TILE_SIZE + (TILE_SIZE - xDir*OBJ_HALF_W) + TILE_OFFSET;
		}
		else
		{
			x = (x&~(TILE_SIZE-1)) - xDir*OBJ_HALF_W + TILE_OFFSET;
		}
	}
}

y += yDir*move_speed_this_frame;

if( yDir != 0 )
{
	var tx1 = (x + OBJ_HALF_W - TILE_OFFSET - 1)>>TILE_SHIFT;		// check right edge
	var tx2 = (x - OBJ_HALF_W - TILE_OFFSET)>>TILE_SHIFT;		// check right edge
	var ty	= ((y + yDir*OBJ_HALF_H - TILE_OFFSET)>>TILE_SHIFT);
		
	var tile1 = tilemap_get(other.m_wall_map, tx1,ty )& tile_index_mask;
	var tile2 = tilemap_get(other.m_wall_map, tx2,ty )& tile_index_mask;
		
	//show_debug_message("(collision Y) tile1:" + string(tile1) + ", tile2: " + string(tile2));
		
	if(( tile1!=0 ) || (tile2!=0))
	{
		if(yDir > 0)
		{
			y = (ty<<TILE_SHIFT) - TILE_SIZE + (TILE_SIZE - yDir*OBJ_HALF_H) + TILE_OFFSET;
		}
		else
		{
			y = (y&~(TILE_SIZE-1)) - yDir*OBJ_HALF_H + TILE_OFFSET;
		}
	}
}
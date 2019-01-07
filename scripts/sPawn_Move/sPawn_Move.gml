#macro TILE_SIZE	16
#macro TILE_SHIFT   4		// 1<<4 = 16
#macro TILE_OFFSET	0

#macro OBJ_HALF_W	5
#macro OBJ_HALF_H	5

sMacro_TileIndex();

var seconds_passed = delta_time/1000000;
var move_speed_this_frame = move_speed*seconds_passed;
	
x += xDir*move_speed_this_frame;

if( xDir != 0 )
{
	var tx	= (x + xDir*OBJ_HALF_W - TILE_OFFSET)>>TILE_SHIFT;		// check right edge
	var ty1 = ((y + OBJ_HALF_H - TILE_OFFSET - 1)>>TILE_SHIFT);
	var ty2 = ((y - OBJ_HALF_H - TILE_OFFSET)>>TILE_SHIFT);
		
	if(sUtil_IsBlocked(tx*TILE_SIZE, ty1*TILE_SIZE, TILE_SIZE, false)
		|| sUtil_IsBlocked(tx*TILE_SIZE, ty2*TILE_SIZE, TILE_SIZE, false))
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
	
	if(sUtil_IsBlocked(tx1*TILE_SIZE, ty*TILE_SIZE, TILE_SIZE, false)
		|| sUtil_IsBlocked(tx2*TILE_SIZE, ty*TILE_SIZE, TILE_SIZE, false))
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
var moveSpeedRate = argument0;

#macro TILE_SIZE	16
#macro TILE_SHIFT   4		// 1<<4 = 16
#macro TILE_OFFSET	0

#macro OBJ_HALF_W	5
#macro OBJ_HALF_H	5

sMacro_TileIndex();

var seconds_passed = delta_time/1000000;
var move_speed_this_frame = m_MoveSpeed*moveSpeedRate*seconds_passed;
	
x += m_DirX*move_speed_this_frame;

if( m_DirX != 0 )
{
	var tx	= (x + m_DirX*OBJ_HALF_W - TILE_OFFSET)>>TILE_SHIFT;		// check right edge
	var ty1 = ((y + OBJ_HALF_H - TILE_OFFSET - 1)>>TILE_SHIFT);
	var ty2 = ((y - OBJ_HALF_H - TILE_OFFSET)>>TILE_SHIFT);
		
	if(sUtil_IsBlocked(tx*TILE_SIZE, ty1*TILE_SIZE, TILE_SIZE, false)
		|| sUtil_IsBlocked(tx*TILE_SIZE, ty2*TILE_SIZE, TILE_SIZE, false))
	{
		if(m_DirX > 0)
		{
			x = (tx<<TILE_SHIFT) - TILE_SIZE + (TILE_SIZE - m_DirX*OBJ_HALF_W) + TILE_OFFSET;
		}
		else
		{
			x = (x&~(TILE_SIZE-1)) - m_DirX*OBJ_HALF_W + TILE_OFFSET;
		}
	}
}

y += m_DirY*move_speed_this_frame;

if( m_DirY != 0 )
{
	var tx1 = (x + OBJ_HALF_W - TILE_OFFSET - 1)>>TILE_SHIFT;		// check right edge
	var tx2 = (x - OBJ_HALF_W - TILE_OFFSET)>>TILE_SHIFT;		// check right edge
	var ty	= ((y + m_DirY*OBJ_HALF_H - TILE_OFFSET)>>TILE_SHIFT);
	
	if(sUtil_IsBlocked(tx1*TILE_SIZE, ty*TILE_SIZE, TILE_SIZE, false)
		|| sUtil_IsBlocked(tx2*TILE_SIZE, ty*TILE_SIZE, TILE_SIZE, false))
	{
		if(m_DirY > 0)
		{
			y = (ty<<TILE_SHIFT) - TILE_SIZE + (TILE_SIZE - m_DirY*OBJ_HALF_H) + TILE_OFFSET;
		}
		else
		{
			y = (y&~(TILE_SIZE-1)) - m_DirY*OBJ_HALF_H + TILE_OFFSET;
		}
	}
}
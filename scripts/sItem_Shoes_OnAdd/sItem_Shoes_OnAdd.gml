var pawn = argument0;

var valueUp = 5;
pawn.m_MoveSpeed += valueUp;
sUtil_CreateNotify(pawn.x, pawn.y, "Speed+" + string(valueUp), 0, -30);

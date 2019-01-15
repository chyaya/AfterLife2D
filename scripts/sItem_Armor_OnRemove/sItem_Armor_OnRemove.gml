var pawn = argument0;

var valueUp = 5;
pawn.m_MaxHealth -= valueUp;
sUtil_CreateNotify(pawn.x, pawn.y, "Max Health-" + string(valueUp), 0, -30);

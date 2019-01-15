var pawn = argument0;

var valueUp = 1;
pawn.m_Damage -= valueUp;
sUtil_CreateNotify(pawn.x, pawn.y, "Damage-" + string(valueUp), 0, -30);

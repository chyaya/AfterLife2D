var pawn = argument0;
var num = argument1;

var value = num;
pawn.m_Damage += value;

var noti = "Damage" + (sign(value) >= 0 ? "+" : "") + string(value);
sUtil_CreateNotify(pawn.x, pawn.y, noti, 0, -30);

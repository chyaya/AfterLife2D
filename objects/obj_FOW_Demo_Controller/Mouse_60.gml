with (obj_FOW_Demo_Player)
{
if FOW_Radius < 15
    {
    FOW_Radius++;
    FOW_Xprev++;
    scr_FOW_Update(x, y, obj_FOW_Wall_Parent);
    }
}


switch(room)
{
case rm_FOW_Normal: room_goto(rm_FOW_Light); break;
case rm_FOW_Light: room_goto(rm_FOW_Views); break;
case rm_FOW_Views: room_goto(rm_FOW_Normal); break;
}



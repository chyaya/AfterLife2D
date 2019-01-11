var list = argument0;

if(ds_list_size(list) == 0)
	return;

var idx = irandom(ds_list_size(m_Sound_Dead)-1);

audio_play_sound(list[|idx], 1, false);

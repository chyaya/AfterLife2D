// Inherit the parent event
event_inherited();

m_MultiplyColor = make_color_rgb(irandom(100) + 155, irandom(100) + 155, irandom(100) + 155);

ds_list_add(m_Sound_Dead, sndManDead1);
ds_list_add(m_Sound_Dead, sndManDead2);
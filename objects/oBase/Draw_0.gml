if(m_OutlineEnable)
{
	shader_set(shSilhouette);
	draw_sprite_ext(sprite_index, -1, x + 1, y, image_xscale, image_yscale, image_angle, m_OutlineColor, 1);
	draw_sprite_ext(sprite_index, -1, x - 1, y, image_xscale, image_yscale, image_angle, m_OutlineColor, 1);
	draw_sprite_ext(sprite_index, -1, x, y + 1, image_xscale, image_yscale, image_angle, m_OutlineColor, 1);
	draw_sprite_ext(sprite_index, -1, x, y - 1, image_xscale, image_yscale, image_angle, m_OutlineColor, 1);
	shader_reset();
}

draw_self();

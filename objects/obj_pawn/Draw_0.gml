if(outline_enable)
{
	shader_set(sh_silhouette);
	draw_sprite_ext(sprite_index, -1, x + 1, y, image_xscale, image_yscale, 0, outline_color, 1);
	draw_sprite_ext(sprite_index, -1, x - 1, y, image_xscale, image_yscale, 0, outline_color, 1);
	draw_sprite_ext(sprite_index, -1, x, y + 1, image_xscale, image_yscale, 0, outline_color, 1);
	draw_sprite_ext(sprite_index, -1, x, y - 1, image_xscale, image_yscale, 0, outline_color, 1);
	shader_reset();
}

draw_self();

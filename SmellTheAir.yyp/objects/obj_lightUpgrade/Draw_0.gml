/// @desc 

if state == ST_lightUpgrade.hover && boolStep(step, 5)
{
	draw_set_flash(newColor, 1);
}
else {shader_set(shd_light);}

draw_sprite_ext(sprite_index, image_index, x, y + y_offset,
	image_xscale, image_yscale, 0, COLOR, 1);

shader_set(shd_default);
draw_set_flash(0, 0);

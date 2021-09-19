/// @desc 

if state == 0 || boolStep(CURRENT_FRAME, 2)
{
	var _s1 = 48, _s2 = 10, 
		_xAdd = -64, _h = CAMERA_H;
	
	draw_shape_polygon4(
		shineX - _s1, shineY,
		shineX + _s1, shineY,
		shineX + _s2 + _xAdd, shineY - _h,
		shineX - _s2 + _xAdd, shineY - _h,
		phaseColor, 0.3
		);
}

if state > 0
{
	if boolStep(step, 5)
	{
		draw_set_flash(phaseColor, 1);
	}
	else {shader_set(shd_light);}
	
	var _h = sprite_height * (step / phaseTime);
	
	draw_sprite_part(sprite_index, image_index, 
		0, _h, sprite_width, sprite_height - _h,
		x - sprite_xoffset, y - sprite_yoffset + _h);

	shader_set(shd_default);
	draw_set_flash(0, 0);
}
/// @desc 

if sprite_index 
{
	if useLightShader {shader_set(shd_light);}
	
	if doesAnimation
	{
		var _x = x;
		
		if shaking {_x = x + 3 * getShakeX( boolStep(CURRENT_FRAME, 4) );}
		draw_sprite_ext(sprite_index, image_index, _x, y,
			image_xscale, image_yscale, 0, COLOR, 1);
		//draw_text(x, y, useLightShader);
	}
	else {draw_self();}
	
	if useLightShader {shader_set(shd_default);}
}

if label != ""
{
	var _x = x, _y = y;
	draw_set_align(1, 1);
	draw_shape_text(_x + 1, _y + 1, label, c_snes, 1);
	draw_shape_text(_x, _y, label, c_white, 1);
}

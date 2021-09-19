/// @desc 

if getFlag(Player_Flag.isOffscreen)
{
	var _y, _dir, _off = 40;
	
	if y < CAMERA_Y {_y = CAMERA_Y + _off; _dir = 0;} 
	else {_y = CAMERA_Y + CAMERA_H - _off; _dir = 180;}
	
	draw_sprite_ext(spr_offscreenArrow, 0, 
		x, _y + pol(boolStep(CURRENT_FRAME, 20)), 1, 1, _dir, drawLightColor[0], 1);
}

if DEBUG
{
	draw_shape_rect(
		x + x_left, y + y_up,
		x + x_right, y + y_down,
		c_green, 1
		);
	
	draw_text(x, y, str_f("[%s][%s / %s] %b", 
		animationIndex, animationStep, animationStepMax, getBit(animationFlag, Animation_Flag.keepIndex)))
}

if sprite_index > 0 
&& !boolStep(iFrames, 4)
{
	// Update Shader
	shader_set(shd_light);
	
	shader_set_uniform_f_array(UNI_LIGHT_COL_LIGHT, colorLight);
	shader_set_uniform_f_array(UNI_LIGHT_COL_TARGET, colorTarget);
	
	// Draw
	if state != ST_player.null
	{
		var _x = x, _y = y;
	
		draw_sprite_ext(sprite_index, image_index, 
			_x, _y,
			image_xscale, 1, 
			0, COLOR, ALPHA
			);
	}
	
	shader_set(shd_default);
}

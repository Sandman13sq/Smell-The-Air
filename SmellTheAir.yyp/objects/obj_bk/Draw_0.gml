/// @desc 

var _color = bkShow, _cloudIndex = 0,
	_y = y, _yadd = sprite_height;
	
	if getGameFlag(Game_Flag.inside) {_y -= 96;}

draw_shape_rectWH(CAMERA_X, CAMERA_Y, CAMERA_W, CAMERA_H, _color, 1);

for (var i = 0; i < cloudCount; i++)
{
	cloudSurface[_cloudIndex] = surface_maintain(cloudSurface[_cloudIndex], CAMERA_W, sprite_height);
	
	surface_set_target(cloudSurface[_cloudIndex]);
	
	draw_shape_rect(0, 0, CAMERA_W, sprite_height, _color, 1);
	
	draw_sprite_tiled_ext(
		sprite_index, i, (cloudStep) * cloudSpeed[_cloudIndex], 0,
		1, 1, cloudShow[_cloudIndex], 1
		);
	
	_color = cloudShow[_cloudIndex];
	
	surface_reset_target();
	
	draw_surface(cloudSurface[_cloudIndex], CAMERA_X, CAMERA_Y + _y);
	
	_y += _yadd;
	_cloudIndex++;
}

draw_shape_rectWH(CAMERA_X, _y, CAMERA_W, CAMERA_H, _color, 1);
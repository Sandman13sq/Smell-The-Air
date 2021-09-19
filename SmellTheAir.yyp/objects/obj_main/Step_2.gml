/// @desc 

if getGameFlag(Game_Flag.cameraFollow)
{
	if instance_exists(PLAYER)
	{
		var _x = clamp(PLAYER.x - CAMERA_W * 0.5, cameraBound[0], cameraBound[2]),
			_y = clamp(PLAYER.y - CAMERA_H * 0.5, cameraBound[1], cameraBound[3]);
	
		CAMERA_X = approach(CAMERA_X, _x, 4);
		CAMERA_Y = approach(CAMERA_Y, _y, 4);
	}
}

camera_set_view_pos(view_camera[view_current], floor(CAMERA_X), floor(CAMERA_Y) );

audio_listener_position(CAMERA_X_CENTER, CAMERA_Y_CENTER, 0);
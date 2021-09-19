/// @desc Snaps camera to player
function cameraSnapToPlayer() {

	with MAIN_OBJ
	{
		CAMERA_X = clamp(getPlayerX() - CAMERA_W / 2, cameraBound[0], cameraBound[2]);
		CAMERA_Y = clamp(getPlayerY() - CAMERA_H / 2, cameraBound[1], cameraBound[3]);
	}


}

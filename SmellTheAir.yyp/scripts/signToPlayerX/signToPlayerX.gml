/// @desc Returns sign to player x
function signToPlayerX() {

	if instance_exists(PLAYER) {return pol(PLAYER.x - x);}

	return pol(x - (CAMERA_X_CENTER));


}

/// @desc Returns sign to player y
function signToPlayerY() {

	if instance_exists(PLAYER) {return pol(PLAYER.y - y);}

	return pol(y - (CAMERA_Y_CENTER));


}

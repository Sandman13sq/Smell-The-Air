/// @desc Sets hit stop
/// @arg frames
function setHitStop(argument0) {

	var _frames = argument0;

	if HITSTOP < abs(_frames)
	{
		HITSTOP = -_frames;
	}


}

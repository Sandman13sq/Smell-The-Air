/// @desc Fades out bgm
/// @arg frames
function bgm_fadeout(argument0) {

	with MAIN_OBJ
	{
		audio_sound_gain(musicCurrent, 0, argument0 * 16.6666);
	}


}

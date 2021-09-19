/// @desc Plays bgm music
/// @arg snd,*loop?
function bgm() {

	with MAIN_OBJ
	{
		var _snd = argument[0],
			_loop = argument_count > 1? argument[1]: true;
	
		audio_stop_sound(musicCurrent);
		musicCurrent = audio_play_sound(_snd, 1, _loop);
		audio_sound_gain(musicCurrent, VOLUME_BGM / 100, 0);
	}


}

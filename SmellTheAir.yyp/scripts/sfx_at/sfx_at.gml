/// @desc Plays sound at position
/// @arg snd,*x,y,*loops?
function sfx_at() {

	var _x = argument_count > 1? argument[1]: x,
		_y = argument_count > 1? argument[2]: y,
		_loop = argument_count > 3? argument[3]: 0;

	var _snd = audio_play_sound_at(argument[0], 
		_x, _y, 0, 400, 500, 1, _loop, 1
		);

	audio_sound_gain(_snd, VOLUME_SFX / 100, 0);

	return _snd;


}

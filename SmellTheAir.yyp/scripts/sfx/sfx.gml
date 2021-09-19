/// @desc Plays sound
/// @arg snd
function sfx(argument0) {

	var _snd = audio_play_sound(argument0, 4, 0);

	audio_sound_gain(_snd, VOLUME_SFX / 100, 0);

	return _snd;


}

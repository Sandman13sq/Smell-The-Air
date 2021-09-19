/// @desc 

ALPHA = 1;

state = 0;

bgm(mus_wish);

with MAIN_OBJ
{
	audio_sound_gain(musicCurrent, 0, 0);
	audio_sound_gain(musicCurrent, VOLUME_BGM / 100, 20000);
}

wasDamaged = getGameFlag(Game_Flag.damageTaken);
if wasDamaged
{
	sprite_index = spr_thankyou;
}
else
{
	sprite_index = spr_lightAndSlash;
}
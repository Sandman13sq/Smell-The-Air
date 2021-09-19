/// @desc 

font_delete(FONT_MAIN_OBJ);

ds_map_destroy(WINDOW_MAP);

structorParticle(0);
structorAnimation(0);
structorEvent(0);
structorRandom(0);

audio_stop_all();

var _l = array_length_1d(recordList);
for (var i = 0; i < _l; i++)
{
	ds_list_destroy(recordList[i]);
}
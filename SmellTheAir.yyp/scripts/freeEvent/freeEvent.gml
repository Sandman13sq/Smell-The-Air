/// @desc Frees event data
/// @arg key
function freeEvent(argument0) {

	var _key = argument0,
		_event = ds_map_find_value(EVENT_MAP, _key);

	ds_stack_destroy(_event[0]);
	ds_stack_destroy(_event[1]);

	ds_map_delete(EVENT_MAP, _key);


}

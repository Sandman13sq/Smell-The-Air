/// @desc Runs event
/// @arg event_key
function runEvent(argument0) {

	var _key = argument0;

	if ds_map_exists(EVENT_MAP, _key)
	{
		// Stop any running events
		instance_destroy(EVENT);
	
		var _event = ds_map_find_value(EVENT_MAP, _key);
	
		with inst_create(EVENT)
		{
			ds_queue_copy(cmdQueue, _event[0]);
			ds_queue_copy(valQueue, _event[1]);
		
			event_user(0);
		}
	}


}

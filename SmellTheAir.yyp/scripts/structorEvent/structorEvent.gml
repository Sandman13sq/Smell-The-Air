/// @desc Structor for events
/// @arg constructor?
function structorEvent(argument0) {

	// Constructor
	if argument0
	{
	#macro EVENT_MAP global.EventMap
		EVENT_MAP = ds_map_create();
	}
	// Destructor
	else
	{
		var _key = ds_map_find_first(EVENT_MAP);
	
		while ds_map_exists(EVENT_MAP, _key)
		{
			freeEvent(_key);
			_key = ds_map_find_first(_key);
		}
	
		ds_map_destroy(EVENT_MAP);
	}


}

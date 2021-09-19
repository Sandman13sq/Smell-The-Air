/// @desc Creates event
/// @arg key,cmd_arr,*cmd_arr,*...
function createEvent() {

	var _key = argument[0],
		_event = [ds_queue_create(), ds_queue_create()],
		_arr, _arrSize;
	
	/*
		FORMAT: [Command, *Value, *Value, *...]
	*/

	// Iterate through command lines
	for (var i = 1; i < argument_count; i++)
	{
		_arr = argument[i];
		_arrSize = array_length_1d(_arr);
	
		// Add Command
		ds_queue_enqueue(_event[0], _arr[0]);
	
		// Add Values
		for (var j = 1; j < _arrSize; j++)
		{
			ds_queue_enqueue(_event[1], _arr[j]);
		}
	}

	// Free event if key already exists
	if ds_map_exists(EVENT_MAP, _key)
	{
		freeEvent(_key);
	}

	ds_map_add(EVENT_MAP, _key, _event);


}

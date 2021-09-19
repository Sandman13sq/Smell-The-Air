/// @desc Checks record and does appropriate saves
/// @arg time,flag
function checkRecord(argument0, argument1) {

	var _time = argument0, _flag = argument1;

	// Find shortest time for category
	for (var c = 0; c <= 4; c++)
	{
		if _flag & (1 << c)
		|| (( (_flag & FL_Star.secret) == FL_Star.secret) && c == 4)
		{
			var _records = MAIN_OBJ.recordList[c + 1],
				_l = ds_list_size(_records);
		
			var _pos = _l;
			for (var i = 0; i < _l; i++) // For Each Record
			{
				if _time < array_get(_records[| i], 0)
				{
					ds_list_insert(_records, i, [_time, _flag]);
					ds_list_delete(_records, _l);
					break;
				}
			}
		}
	}

	// Find shortest time for all
	var _records = MAIN_OBJ.recordList[0],
		_l = ds_list_size(_records);

	var _pos = _l;

	for (var i = 0; i < _l; i++)
	{
		if _time < array_get(_records[| i], 0)
		{
			_pos = i;
			ds_list_insert(_records, i, [_time, _flag]);
			ds_list_delete(_records, _l);
			break;
		}
	}

	if (( (_flag & FL_Star.secret) == FL_Star.secret) )
	{
		_flag |= FL_Star.final;
	}

	MAIN_OBJ.starFlag |= _flag;

	saveSettings();

	// New Record
	if _pos == 0
	{
		return true;
	}

	return false;


}

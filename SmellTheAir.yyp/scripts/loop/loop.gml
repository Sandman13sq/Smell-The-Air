/// @desc Loops value
/// @arg value,min,limit
function loop(argument0, argument1, argument2) {

	var _value = argument0, 
		_min = argument1,
		_limit = argument2;

	if _value >= _min && _value < _limit
	{
		return _value;
	}

	var _interval = _limit - _min;

	while _value < _min
	{
		_value += _interval;
	}

	while _value >= _limit
	{
		_value -= _interval;
	}

	return _value;


}

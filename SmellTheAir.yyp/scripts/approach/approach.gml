/// @desc Approaches target value
/// @arg value,target_value,step
function approach(argument0, argument1, argument2) {

	var _value = argument0, _target = argument1, _step = argument2;

	if (_value + _step) < _target
	{
		return _value + _step;
	}
	else if (_value - _step) > _target
	{
		return _value - _step;
	}
	else
	{
		return _target;
	}


}

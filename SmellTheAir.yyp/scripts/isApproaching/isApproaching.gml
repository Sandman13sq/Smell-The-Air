/// @desc Returns true if speed is approaching value
/// @arg value,target_value,step
function isApproaching(argument0, argument1, argument2) {

	var _value = argument0, _target = argument1, _step = argument2,

	if _value < _target
	{
		return _step > 0;
	}
	else if _value > _target
	{
		return _step < 0;
	}
	else
	{
		return _step == 0;
	}


}

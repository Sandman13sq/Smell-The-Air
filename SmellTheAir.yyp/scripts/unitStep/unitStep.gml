/// @desc Returns unit step in intervals
/// @arg value,interval
function unitStep(argument0, argument1) {

	var _value = argument0, _interval = argument1;

	return clamp(floor(_value * _interval) / (_interval - 1), 0, 1);


}

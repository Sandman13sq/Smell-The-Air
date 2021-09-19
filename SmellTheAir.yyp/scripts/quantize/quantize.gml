/// @desc Steps a value
/// @arg value,interval
function quantize(argument0, argument1) {

	var _value = argument0, _interval = argument1;

	return floor(_value / _interval) * _interval;


}

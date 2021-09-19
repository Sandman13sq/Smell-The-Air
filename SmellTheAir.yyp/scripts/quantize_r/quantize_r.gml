/// @desc Steps a value using rounding
/// @arg value,interval
function quantize_r(argument0, argument1) {

	var _value = argument0, _interval = argument1;

	return round(_value / _interval) * _interval;


}

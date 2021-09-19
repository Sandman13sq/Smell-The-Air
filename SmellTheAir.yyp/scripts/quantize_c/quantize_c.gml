/// @desc Steps a value using ceiling
/// @arg value,interval
function quantize_c(argument0, argument1) {

	var _value = argument0, _interval = argument1;

	return ceil(_value / _interval) * _interval;


}

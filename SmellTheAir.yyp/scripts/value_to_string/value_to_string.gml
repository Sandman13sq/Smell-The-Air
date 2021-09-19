/// @desc Converts value to string with a number of digits
/// @arg value,digits
function value_to_string(argument0, argument1) {

	var _value = round(argument0), _digits = argument1,
		_str = string(_value), _l = string_length(_str);

	return string_repeat("0", _digits - _l) + _str;


}

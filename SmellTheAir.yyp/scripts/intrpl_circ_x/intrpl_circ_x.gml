/// @description  @desc Interpolates value using a quarter circle function
/// @arg val1,val2,amt,strength
/// intrpl_circ_x(val1,val2,amt,strength)
function intrpl_circ_x(argument0, argument1, argument2, argument3) {

	// Slow start, but more drastic

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1),
	    _v = argument3;

	return lerp(_val1, _val2, 1 - power(1 - _amt * _amt, 1 / _v));



}

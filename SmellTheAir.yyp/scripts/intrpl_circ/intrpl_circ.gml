/// @description  @desc Interpolates value using a quarter circle function
/// @arg val1,val2,amt
/// intrpl_circ(val1,val2,amt)
function intrpl_circ(argument0, argument1, argument2) {

	// Slow start, but more drastic

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1);

	/*
	    y = 1 - (1 - x^2)^(1/v)
	    v = 2
	    1/v = 1/2 = 0.5
	*/

	return lerp(_val1, _val2, 1 - power(1 - _amt * _amt, 0.5));



}

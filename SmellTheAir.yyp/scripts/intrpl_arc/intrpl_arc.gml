/// @description  @desc Interpolates value using quadratic function
/// @arg val1,val2,amt
/// intrpl_arc(val1,val2,amt)
function intrpl_arc(argument0, argument1, argument2) {

	/*
	    Goes from val1, to val2, to val1 in an arc
	    1 - ( (4 * x - 2) ^ 2 ) * 0.25
	*/

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1);

	var _x = (-power(4 * _amt - 2, 2) * 0.25) + 1;

	return lerp(_val1, _val2, _x);



}

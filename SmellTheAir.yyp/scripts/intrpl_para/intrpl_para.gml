/// @description  @desc Interpolates value using a parabolic function
/// @arg val1,val2,amt
/// intrpl_para(val1,val2,amt)
function intrpl_para(argument0, argument1, argument2) {

	// Slow start

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1);

	return lerp(_val1, _val2, power(_amt, 2));



}

/// @description  @desc Interpolates value using a parabolic function
/// @arg val1,val2,amt,strength
/// intrpl_para2_x(val1,val2,amt,strength)
function intrpl_para2_x(argument0, argument1, argument2, argument3) {

	// Slow start & stop

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1),
	    _v = argument3;

	// Use hill curve
	if _amt < 0.5
	{
	    return lerp(_val1, _val2, power(2 * _amt, _v) * 0.5);
	}
	// Use valley curve
	else
	{
	    return lerp(_val1, _val2, 1 + ( -power(-2 * (_amt - 1), _v) * 0.5 ));
	}



}

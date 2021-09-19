/// @description  @desc Interpolates value using a parabolic function
/// @arg val1,val2,amt
/// intrpl_para2(val1,val2,amt)
function intrpl_para2(argument0, argument1, argument2) {

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1),

	// Use rising slope
	if _amt < 0.5
	{
	    return lerp(_val1, _val2, power(2 * _amt, 2) * 0.5);
	}
	// Use leveling slope
	else
	{
	    return lerp(_val1, _val2, 1 + (-power(-2 * (_amt - 1), 2) * 0.5 ));
	}



}

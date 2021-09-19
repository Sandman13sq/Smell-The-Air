/// @description  @desc Interpolates value using two parabolic functions
/// @arg val1,val2,amt,strength1,strength2
/// intrpl_para2_xy(val1,val2,amt,strength1,strength2)
function intrpl_para2_xy(argument0, argument1, argument2, argument3, argument4) {

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1),
	    _v1 = argument3,
	    _v2 = argument4;

	if _amt < 0.5
	{
	    return lerp(_val1, _val2, power(2 * _amt, _v1) * 0.5);
	}
	else
	{
	    return lerp(_val1, _val2, 1 + ( -power(-2 * (_amt - 1), _v2) * 0.5) );
	}



}

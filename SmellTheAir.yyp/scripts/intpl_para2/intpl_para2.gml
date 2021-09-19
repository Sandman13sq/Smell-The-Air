/// @desc Interpolates using 2 parabolas
/// @arg val1,val1,amt
function intpl_para2(argument0, argument1, argument2) {

	var _val1 = argument0, _val2 = argument1, _amt = argument2;

	if _amt < 0.5
	{
		return lerp(_val1, _val2, power(2 * _amt, 2) * 0.5);
	}
	else
	{
		return lerp(_val1, _val2, 1 + (-power(-2 * (_amt - 1), 2) * 0.5 ));
	}


}

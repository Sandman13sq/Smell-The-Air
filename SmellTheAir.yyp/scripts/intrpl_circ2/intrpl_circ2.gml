/// @description  Interpolates value using two quarter circle functions
/// @arg val1,val2,amt
function intrpl_circ2(argument0, argument1, argument2) {

	var _val1 = argument0,
	    _val2 = argument1,
	    _amt = clamp(argument2, 0, 1);

	/*
	    if t < 0.5
	        y = (1 - (1 - 4x^2)^(1/v) ) / 2
	    else
	        y = (1 + (1 - 4(x - 1)^2 )^(1/v) ) / 2
	*/

	// Use valley
	if _amt < 0.5
	{
	    return lerp(_val1, _val2, 
	        (1 - power(1 - 4 * _amt * _amt, 0.5)) * 0.5
	        );
	}
	// Use hill
	else
	{
	    _amt -= 1;
	    return lerp(_val1, _val2, 
	        (1 + power(1 - 4 * _amt * _amt, 0.5)) * 0.5
	        );
	}





}

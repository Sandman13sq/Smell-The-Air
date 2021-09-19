/// @desc Interpolates using parabola
/// @arg val1,val1,amt
function intpl_para(argument0, argument1, argument2) {

	var _val1 = argument0, _val2 = argument1, _amt = argument2;

	return lerp(_val1, _val2, power(_amt, 2));


}

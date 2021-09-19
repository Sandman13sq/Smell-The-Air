/// @desc Returns clamped amount from range
/// @arg val,bound1,bound2
function rangeToAmt(argument0, argument1, argument2) {

	var _val = argument0, _bnd1 = argument1, _bnd2 = argument2;

	return clamp( (_val - _bnd1) / (_bnd2 - _bnd1), 0, 1);


}

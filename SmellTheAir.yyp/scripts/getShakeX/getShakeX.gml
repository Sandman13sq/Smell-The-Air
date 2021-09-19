/// @desc Returns shaken x position
/// @arg value
function getShakeX(argument0) {

	var _x = argument0;

	return pol( (_x div 2) mod 2) * sqrt(_x);


}

/// @desc Returns -1, 1, or 0 based on values given
/// @arg +value,-value
function lever(argument0, argument1) {

	var _pos = argument0? 1: 0,
		_neg = argument1? 1: 0;

	return _pos - _neg;


}

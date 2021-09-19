/// @desc Pushes all values of an array up by one
/// @arg arr,index
function array_push(argument0, argument1) {

	var _arr = argument0, _pos = argument1;

	var _l = array_length_1d(_arr);

	for (var i = _l - 1; i > _pos; i--)
	{
		_arr[@ i] = _arr[i - 1];
	}


}

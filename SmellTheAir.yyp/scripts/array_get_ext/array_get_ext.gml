/// @desc Returns array value
/// @arg arr,index,index,...
function array_get_ext() {

	var _arr = argument[0], _l = argument_count - 1;

	for (var i = 1; i < _l; i++)
	{
		_arr = _arr[@ argument[i]];
	}

	return _arr[@ argument[_l]];


}

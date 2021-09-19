/// @desc Returns next event values
/// @arg count
function getEventValMulti(argument0) {

	var _count = argument0,
		_arr = array_create(_count);

	for (var i = 0; i < _count; i++)
	{
		_arr[i] = ds_stack_pop(valQueue);
	}

	return _arr;


}

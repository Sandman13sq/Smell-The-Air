/// @desc Creates string from array
/// @arg array,sep
function string_from_array(argument0, argument1) {

	var _arr = argument0, _sep = argument1;

	var _l = array_length_1d(_arr), _str = "";

	for (var i = 0; i < _l; i++)
	{
		if is_array(_arr[i]) {_str += string_from_array(_arr[i], _sep);}
		else {_str += string(_arr[i]);}
	
		if i < _l - 1 {_str += _sep;}
	}

	return _str;


}

/// @desc Returns concatenated string
/// @arg *string,*string,*...
function str() {

	var _str = string(argument[0]);

	for (var i = 1; i < argument_count; i++)
	{
		_str += string(argument[i]);
	}

	return _str;


}

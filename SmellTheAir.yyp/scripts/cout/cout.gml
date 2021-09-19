/// @desc Outputs string to console
/// @arg *string,*string,*...
function cout() {

	return;

	var _str = string(argument[0]);

	for (var i = 1; i < argument_count; i++)
	{
		_str += string(argument[i]);
	}

	show_debug_message(_str);



}

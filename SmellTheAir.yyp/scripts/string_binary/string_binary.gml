/// @desc Returns string as 0's and 1's
/// @arg value,*digits
function string_binary() {

	var _value = argument[0], _digits = argument_count > 1? argument[1]: 8;

	var _str = "";

	for (var i = _digits - 1; i >= 0; i--)
	{
		if _value & (1 << i)
		{
			_str += "1";
		}
		else
		{
			_str += "0";
		}
	}

	return _str;


}

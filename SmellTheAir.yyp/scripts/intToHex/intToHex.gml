/// @desc Converts integer to hex string
/// @arg value,*digits
function intToHex() {

	var _value = floor(abs(argument[0])), 
		_digits = argument_count > 1? argument[1]: 6,
		_str = "";

	while _value > 0
	{
		switch(_value & 0xF)
		{
			// 0 - 9
			default: _str = string(_value & 0xF) + _str; break;
		
			case(10): _str = "A" + _str; break;
			case(11): _str = "B" + _str; break;
			case(12): _str = "C" + _str; break;
			case(13): _str = "D" + _str; break;
			case(14): _str = "E" + _str; break;
			case(15): _str = "F" + _str; break;
		}
	
		_value = _value >> 4;
		_digits--;
	}

	if _digits > 0
	{
		_str = string_repeat("0", _digits) + _str;
	}

	return _str;


}

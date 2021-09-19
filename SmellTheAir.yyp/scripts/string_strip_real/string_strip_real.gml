/// @desc Returns reals separated by whitespace as array
/// @arg string
function string_strip_real(argument0) {

	var _str = argument0 + " ";

	var _tempstr = "", _pos = 1, _l = string_length(_str);

	var _arr = [], _arrPos = 0, _chr;

	while(1)
	{
		if _pos > _l {break;}
	
		_chr = string_char_at(_str, _pos);
	
		switch(_chr)
		{
			default:
				_tempstr += _chr;
				break;
		
			case(" "):
			case("\n"):
			case("\t"):
				if string_digits(_tempstr) != ""
				{
					_arr[_arrPos] = real(_tempstr); _arrPos++;
				}
				_tempstr = "";
				break;
		}
	
		_pos++;
	}

	return _arr;


}

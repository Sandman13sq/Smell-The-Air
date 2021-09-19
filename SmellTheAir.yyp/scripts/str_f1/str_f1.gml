/// @desc Returns formatted string in python style
/// @arg string_with_%'s,*val,*val,*...
function str_f1() {

	var _str = argument[0];

	var _code, i = 1, _pos;

	repeat(argument_count - 1)
	{
		_pos = string_pos("%", _str) + 1;
		_code = string_char_at( _str, _pos );
	
		if _code == "" {break;}
	
		switch(_code)
		{
			// String
			case("s"):
				_str = string_replace(_str, "%s", string(argument[i]) );
				i++;
				break;
		
			// Integer
			case("d"):
				_str = string_replace(_str, "%d", floor(argument[i]) );
				i++;
				break;
		
			// Float
			case("f"):
				_str = string_replace(_str, "%f", string_format(argument[i], 1, 2) );
				i++;
				break;
		
			// Float with number of points
			case("."):
				var _digits = "", _char = "!";
				_pos++;
			
				while ( _char != "f" )
				{
					_char = string_char_at(_str, _pos);
				
					if ord(_char) < 0x20 {break;}
					if _char == "f" {break;}
				
					_digits += _char;
					_pos++;
				}
			
				if _digits != ""
				{
					var _targetString = "%." + _digits + "f";
					_str = string_replace(_str, _targetString, string_format(argument[i], 1, real(_digits) ) );
					i++;
				}
				break;
		
			// Hex
			case("x"):	// Lowercase
			case("X"):	// Uppercase
				var _val = floor(argument[i]), _hex = "", h = 1,
				_hexOff = _code == "X"? 0x41: 0x61, _digit;
			
				if _val == 0 {_hex = "0";}
				else
				{
					while _val > 0
					{
						_digit = _val mod power(16, h);
						_hex = chr( _digit < 10? (_digit + 0x30): (_digit + _hexOff - 10) ) + _hex;
						_val = _val div power(16, h);
					
						h++;
					}
				}
			
				_str = string_replace(_str, "%" + _code, _hex);
				i++;
				break;
		}
	}

	return _str;


}

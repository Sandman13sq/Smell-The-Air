/// @desc Outputs formatted string to console
/// @arg string_with_%'s,value,value,...
function cout_f() {

	var _str = argument[0], _chr, i = 1;

	while (string_count("%", _str))
	{
		_chr = string_char_at(_str, string_pos("%", _str) + 1);
	
		switch(_chr)
		{
			default:
				_str = string_replace(_str, "%" + _chr, "");
				break;
		
			case("s"):
				_str = string_replace(_str, "%s", string(argument[i]) );
				i++;
				break;
		
			case("d"):
				_str = string_replace(_str, "%d", string( floor(argument[i]) ));
				i++;
				break;
		
			case("f"):
				_str = string_replace(_str, "%f", string_format(argument[i], 1, 4) );
				i++;
				break;
		}
	}

	show_debug_message(_str);


}

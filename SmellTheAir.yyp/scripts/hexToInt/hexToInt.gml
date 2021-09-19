/// @desc Converts hex string to integer
/// @arg string
function hexToInt(argument0) {

	var _str = argument0;

	_str = string_replace(_str, "0x", "");
	_str = string_replace(_str, "0h", "");

	var _l = string_length(_str), _n = _l - 1, _val = 0;

	for (var i = 1; i <= _l; i++)
	{
		switch(string_upper( string_char_at(_str, i) ) )
		{
			case("0"): _val += 0 << (4 * _n); _n -= 1; break;
			case("1"): _val += 1 << (4 * _n); _n -= 1; break;
			case("2"): _val += 2 << (4 * _n); _n -= 1; break;
			case("3"): _val += 3 << (4 * _n); _n -= 1; break;
			case("4"): _val += 4 << (4 * _n); _n -= 1; break;
			case("5"): _val += 5 << (4 * _n); _n -= 1; break;
			case("6"): _val += 6 << (4 * _n); _n -= 1; break;
			case("7"): _val += 7 << (4 * _n); _n -= 1; break;
			case("8"): _val += 8 << (4 * _n); _n -= 1; break;
			case("9"): _val += 9 << (4 * _n); _n -= 1; break;
		
			case("A"): _val += 10 << (4 * _n); _n -= 1; break;
			case("B"): _val += 11 << (4 * _n); _n -= 1; break;
			case("C"): _val += 12 << (4 * _n); _n -= 1; break;
			case("D"): _val += 13 << (4 * _n); _n -= 1; break;
			case("E"): _val += 14 << (4 * _n); _n -= 1; break;
			case("F"): _val += 15 << (4 * _n); _n -= 1; break;
		
			default: break;
		}
	}

	return _val;


}

/// @desc Converts number to time string
/// @arg frames
function string_time(argument0) {

	var _val = argument0,
		_minute = _val div 3600,
		_second = (_val div 60) mod 60,
		_centisecond = (_val mod 60) * 100 / 60;

	return value_to_string(_minute, 2) 
		+ ":" + value_to_string(_second, 2)
		+ ":" + value_to_string(_centisecond, 2);


}

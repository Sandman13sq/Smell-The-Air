/// @desc Converts time to frames
/// @arg minute,second,centisecond
function time_val(argument0, argument1, argument2) {

	var _minute = argument0,
		_second = argument1,
		_centisecond = lerp(0, 60, argument2 * 0.01);

	return (
		_minute * 60 * 60 + 
		_second * 60 +
		round(_centisecond)
		);


}

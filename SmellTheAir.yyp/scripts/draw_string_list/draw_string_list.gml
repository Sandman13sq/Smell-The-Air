/// @desc Draws string as list
/// @arg x,y,str,str,...
function draw_string_list() {

	var _x = argument[0], _y = argument[1],
		_str = "";
	
	for (var i = 2; i < argument_count; i++)
	{
		_str += string(argument[i]) + "\n";
	}

	draw_text(_x, _y, _str);


}

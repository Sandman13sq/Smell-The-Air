/// @desc Draws text with shadow
/// @arg x,y,text,color
function Dtext(argument0, argument1, argument2, argument3) {

	var _x = argument0, _y = argument1,
		_text = argument2, _c = argument3;

	draw_shape_text(_x + 1, _y + 1, _text, c_snes, 1);
	draw_shape_text(_x, _y, _text, _c, 1);


}

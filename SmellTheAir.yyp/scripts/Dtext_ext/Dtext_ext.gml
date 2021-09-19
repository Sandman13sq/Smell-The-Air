/// @desc Draws text with shadow
/// @arg x,y,text,color,sep,w
function Dtext_ext(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _x = argument0, _y = argument1,
		_text = argument2, _c = argument3,
		_w = argument5, _sep = argument4;

	draw_shape_text_ext(_x + 1, _y + 1, _text, _sep, _w, c_snes, 1);
	draw_shape_text_ext(_x, _y, _text, _sep, _w, _c, 1);


}

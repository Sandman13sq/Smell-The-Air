/// @description  Draws border
/// @arg x1,y1,x2,y2,border_size,color,alpha
/// draw_shape_border(x1,y1,x2,y2,border_size,color,alpha)
function draw_shape_border(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = argument0, _y = argument1,
	    _w = argument2 - _x + 1, _h = argument3 - _y + 1,
	    _in = argument4,
	    _c = argument5, _a = argument6;

	if _in < 0
	{
	    _in *= -1;
	    _x -= _in; _y -= _in;
	    _w += _in * 2; _h += _in * 2;
	}

	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x, _y, _w - _in, _in, _c, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x + _w - _in, _y, _in, _h - _in, _c, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x + _in, _y + _h - _in, _w - _in, _in, _c, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x, _y + _in, _in, _h - _in, _c, _a);



}

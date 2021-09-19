/// @description  Draws box [Two rectangles]
/// @arg x,y,w,h,border_size,color_in,color_rim,alpha
/// draw_shape_boxWH(x,y,w,h,border_size,color_in,color_rim,alpha)
function draw_shape_boxWH(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {

	var _x = argument0, _y = argument1,
	    _w = argument2, _h = argument3,
	    _in = argument4,
	    _c = argument5, _cRim = argument6, _a = argument7;

	if _in < 0
	{
	    _in *= -1;
	    _x -= _in; _y -= _in;
	    _w += _in * 2; _h += _in * 2;
	}

	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x, _y, _w - _in, _in, _cRim, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x + _w - _in, _y, _in, _h - _in, _cRim, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x + _in, _y + _h - _in, _w - _in, _in, _cRim, _a);
	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x, _y + _in, _in, _h - _in, _cRim, _a);

	draw_sprite_stretched_ext(spr_dmrPixel, 0, 
	    _x + _in, _y + _in, _w - _in * 2, _h - _in * 2, _c, _a);



}

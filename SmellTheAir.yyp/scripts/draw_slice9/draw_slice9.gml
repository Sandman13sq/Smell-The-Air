/// @description  Draws 9 slice
/// @arg sprite,x1,y1,x2,y2,color,alpha
/// draw_slice9(sprite,x1,y1,x2,y2,color,alpha)
function draw_slice9(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _spr = argument0,
	    _x = argument1, _y = argument2,
	    _w = argument3 - _x, _h = argument4 - _y,
	    _c = argument5, _a = argument6,
	    _sprW = sprite_get_width(_spr),
	    _sprH = sprite_get_height(_spr);

	var _xA = _x + _sprW, _xB = _x + _w - _sprW,
	    _yA = _y + _sprH, _yB = _y + _h - _sprH,
	    _wA = _xB - _xA, 
	    _hA = _yB - _yA;

	// Middle
	draw_sprite_stretched_ext(_spr, 4, _xA, _yA, _wA, _hA, _c, _a);

	// Sides
	draw_sprite_stretched_ext(_spr, 1, _xA, _y,  _wA, _sprH, _c, _a);
	draw_sprite_stretched_ext(_spr, 7, _xA, _yB, _wA, _sprH, _c, _a);
	draw_sprite_stretched_ext(_spr, 3, _x,  _yA, _sprW, _hA, _c, _a);
	draw_sprite_stretched_ext(_spr, 5, _xB, _yA, _sprW, _hA, _c, _a);

	// Corners
	draw_sprite_stretched_ext(_spr, 0, _x,  _y,  _sprW, _sprH, _c, _a);
	draw_sprite_stretched_ext(_spr, 2, _xB, _y,  _sprW, _sprH, _c, _a);
	draw_sprite_stretched_ext(_spr, 6, _x,  _yB, _sprW, _sprH, _c, _a);
	draw_sprite_stretched_ext(_spr, 8, _xB, _yB, _sprW, _sprH, _c, _a);



}

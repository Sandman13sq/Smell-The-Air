/// @description  Draws 3 slice vertically
/// @arg sprite,x,y,h,color,alpha
/// draw_slice3H(sprite,x,y,h,color,alpha)
function draw_slice3H(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _spr = argument0,
	    _x = argument1, _y = argument2,
	    _h = argument3,
	    _c = argument4, _a = argument5,
	    _sprW = sprite_get_width(_spr),
	    _sprH = sprite_get_height(_spr);

	draw_sprite_ext(_spr, 0, _x, _y, 1, 1, 0, _c, _a);
	draw_sprite_stretched_ext(_spr, 1, _x, _y + _sprH, _sprW, _h - _sprH * 2, _c, _a);
	draw_sprite_ext(_spr, 2, _x, _y + _h - _sprH, 1, 1, 0, _c, _a);



}

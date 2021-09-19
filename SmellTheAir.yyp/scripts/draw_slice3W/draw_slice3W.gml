/// @description  Draws 3 slice
/// @arg sprite,x,y,w,color,alpha
/// draw_slice3W(sprite,x,y,w,color,alpha)
function draw_slice3W(argument0, argument1, argument2, argument3, argument4, argument5) {

	var _spr = argument0,
	    _x = argument1, _y = argument2,
	    _w = argument3,
	    _c = argument4, _a = argument5,
	    _sprW = sprite_get_width(_spr),
	    _sprH = sprite_get_height(_spr);

	draw_sprite_ext(_spr, 0, _x, _y, 1, 1, 0, _c, _a);
	draw_sprite_stretched_ext(_spr, 1, _x + _sprW, _y, _w - _sprW * 2, _sprH, _c, _a);
	draw_sprite_ext(_spr, 2, _x + _w - _sprW, _y, 1, 1, 0, _c, _a);



}

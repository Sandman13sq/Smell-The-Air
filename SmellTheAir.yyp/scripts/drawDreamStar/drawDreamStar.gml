/// @desc draws Dream star at location
/// @arg x,y,sub,color,rim_color,alpha,rimAlpha
function drawDreamStar(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {

	var _x = argument0, _y = argument1,
		_sub = argument2 mod 6,
		_col = argument3, _colRim = argument4, 
		_a = argument5, _aRim = argument6;

	draw_sprite_ext(spr_dreamstar, _sub, _x, _y, 1, 1, 0, _col, _a);
	draw_sprite_ext(spr_dreamstar, _sub + 6, _x, _y, 1, 1, 0, c_white, _aRim);
	draw_sprite_ext(spr_dreamstar, _sub + 12, _x, _y, 1, 1, 0, _colRim, _aRim);




}

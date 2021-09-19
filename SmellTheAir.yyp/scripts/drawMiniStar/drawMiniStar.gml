/// @desc draws mini stars at location
/// @arg x,y,flag,space?
function drawMiniStar(argument0, argument1, argument2, argument3) {

	var _x = argument0, _y = argument1,
		_flag = argument2, _space = argument3;

	for (var i = 0; i < 5; i++)
	{
		if _flag & 1 << i
		{
			draw_sprite_ext(spr_ministar, 0, _x, _y, 1, 1, 0, starColor[i], 1);
			_x += 10;
		}
		else if _space {_x += 10;}
	}



}

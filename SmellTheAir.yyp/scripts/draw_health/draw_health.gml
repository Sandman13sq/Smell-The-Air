/// @desc Draws health light
/// @arg x,y,health,healthMax,color
function draw_health(argument0, argument1, argument2, argument3, argument4) {

	var _x = argument0, _y = argument1,
		_hp = argument2, _hpMax = argument3,
		_color = argument4;

	var _diff = ceil(_hpMax - _hp),
		_half = floor(_hpMax - _hp);

	draw_sprite(spr_lifemeter, 0, _x, _y);
	_y += 8;

	for (var i = 0; i < _hpMax; i++)
	{
		draw_sprite(spr_lifemeter, 2, _x, _y);
	
		if i >= _diff 
		|| (i == _half && boolStep(CURRENT_FRAME, 4))
		{
			draw_sprite_ext(spr_lifemeter, 1, _x, _y, 1, 1, 0, _color, 1);
		}
		
		_y += 8;
	}

	draw_sprite(spr_lifemeter, 3, _x, _y);


}

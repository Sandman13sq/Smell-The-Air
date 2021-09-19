/// @desc 

// Inherit the parent event
//event_inherited();

var _x = x + getShakeX(shakeX);
draw_sprite(sprite_index, state == 2, _x, y);

var _flash = state == 2 && boolStep(CURRENT_FRAME, 4),
	_sub = _flash? 3: 2;

if _flash {shader_set(shd_light);}

for (var i = -1; i > -6; i--)
{
	draw_sprite(sprite_index, _sub, _x, y + i * sprite_height);
}

if _flash {shader_set(shd_default);}